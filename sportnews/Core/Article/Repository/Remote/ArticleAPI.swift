enum ArticleAPI {
  case topHeadlines(sourceId: String, apiKey: String)
  case allRecent(sourceId: String, apiKey: String)
}

extension ArticleAPI: API {
  var endPoint: EndPoint {
    switch self {
    case .topHeadlines(let sourceId, let apiKey):
      return EndPoint(
        path: "/top-headlines?sources=\(sourceId)&apiKey=\(apiKey)",
        method: .get
      )
      
    case .allRecent(let sourceId, let apiKey):
      return EndPoint(
        path: "/everything?sources=\(sourceId)&apiKey=\(apiKey)",
        method: .get
      )
    }
  }
}
