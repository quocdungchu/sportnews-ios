import RxSwift

protocol ArticleRemoteRepositiory {
  func load(sourceId: Source.Id, section: Section) -> Single<[Article]>
}

class ArticleRemoteRepositioryImpl: BaseRemoteRepository {
  private func loadTopHeadlines(sourceId: Source.Id) -> Single<[Article]> {
    return ArticleAPI.topHeadlines(sourceId: sourceId.remoteId, apiKey: apiKey)
      .fetchJson(at: baseURL, with: sessionManager)
      .map {
        try $0.makeArticles(sourceId: sourceId.remoteId, tags: [.topHeadlines])
      }
  }
  
  private func loadAllRecent(sourceId: Source.Id) -> Single<[Article]> {
    return ArticleAPI.allRecent(sourceId: sourceId.remoteId, apiKey: apiKey)
      .fetchJson(at: baseURL, with: sessionManager)
      .map {
        try $0.makeArticles(sourceId: sourceId.remoteId)
      }
  }
}

extension ArticleRemoteRepositioryImpl: ArticleRemoteRepositiory {
  func load(sourceId: Source.Id, section: Section) -> Single<[Article]> {
    switch section {
    case .topHeadlines:
      return loadTopHeadlines(sourceId: sourceId)
        
    case .allRecent:
      return loadAllRecent(sourceId: sourceId)
    }
  }
}
