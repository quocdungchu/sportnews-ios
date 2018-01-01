import RxSwift

enum LoadingOption {
  case topHeadlines
  case allRecent
}
protocol ArticleUseCase {
  func load(sourceId: Source.Id, option: LoadingOption) -> Single<[Article]>
}

class ArticleUseCaseImpl {
  
  let remoteRepository: ArticleRemoteRepositiory
  
  init(remoteRepository: ArticleRemoteRepositiory) {
    self.remoteRepository = remoteRepository
  }
}

extension ArticleUseCaseImpl: ArticleUseCase {
  func load(sourceId: Source.Id, option: LoadingOption) -> Single<[Article]> {
    return remoteRepository.load(sourceId: sourceId, option: option)
  }
}
