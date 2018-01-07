import RxSwift

enum Section {
  case topHeadlines
  case allRecent
}
protocol ArticleUseCase {
  func synchronize()
  func load(sourceId: Source.Id, section: Section) -> [Article]
}

class ArticleUseCaseImpl {
  
  let remoteRepository: ArticleRemoteRepositiory
  let localRepository: ArticleLocalRepository
  let eventSender: ArticleEventSender
  
  private let bag = DisposeBag()
  
  init(
    remoteRepository: ArticleRemoteRepositiory,
    localRepository: ArticleLocalRepository,
    eventSender: ArticleEventSender)
  {
    self.remoteRepository = remoteRepository
    self.localRepository = localRepository
    self.eventSender = eventSender
  }
  
  func download(sourceId: Source.Id, section: Section) -> Single<[Article]> {
    return remoteRepository.load(sourceId: sourceId, section: section)
      .do(onNext: { [unowned self] articles in
        self.localRepository.save(articles: articles, for: sourceId)
        self.eventSender.send(event: .didDownload(articles: articles, sourceId: sourceId, section: section))
      })
  }
}

extension ArticleUseCaseImpl: ArticleUseCase {
  func synchronize(){
    Observable.from([
        download(sourceId: .espn, section: .allRecent),
        download(sourceId: .espn, section: .topHeadlines)
      ])
      .asObservable()
      .merge()
      .subscribe(onCompleted: { [unowned self] in
        self.eventSender.send(event: .didSynchronize)
      })
      .disposed(by: bag)
  }
  
  func load(sourceId: Source.Id, section: Section) -> [Article] {
    return localRepository.loadArticles(for: sourceId)
  }
}
