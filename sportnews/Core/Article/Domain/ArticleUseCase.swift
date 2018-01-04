import RxSwift

enum LoadingOption {
  case topHeadlines
  case allRecent
}
protocol ArticleUseCase {
  func synchronize()
  func load(sourceId: Source.Id, option: LoadingOption) -> Single<[Article]>
}

class ArticleUseCaseImpl {
  
  let remoteRepository: ArticleRemoteRepositiory
  let eventSender: ArticleEventSender
  
  private let bag = DisposeBag()
  
  init(remoteRepository: ArticleRemoteRepositiory, eventSender: ArticleEventSender) {
    self.remoteRepository = remoteRepository
    self.eventSender = eventSender
  }
}

extension ArticleUseCaseImpl: ArticleUseCase {
  func synchronize(){
    load(sourceId: .espn, option: .allRecent).subscribe().disposed(by: bag)
    load(sourceId: .espn, option: .topHeadlines).subscribe().disposed(by: bag)
  }
  
  func load(sourceId: Source.Id, option: LoadingOption) -> Single<[Article]> {
    return remoteRepository.load(sourceId: sourceId, option: option)
      .do(onNext: { [unowned self] articles in
        self.eventSender.send(event: .didLoad(
          articles: articles,
          sourceId: sourceId,
          option: option
        ))
      })
  }
}
