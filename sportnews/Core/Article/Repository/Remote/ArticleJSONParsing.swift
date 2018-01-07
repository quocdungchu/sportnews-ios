import SwiftyJSON

extension Source.Id {
  var remoteId: String {
    return rawValue
  }
}

extension JSON {
  func makeArticle(sourceId: String, tags: [Tag] = []) throws -> Article {
    guard let title = self["title"].string,
      let url = self["url"].string else
    {
      throw RemoteError(.badJsonFormat)
    }
    
    return Article(
      sourceId: sourceId,
      author: self["author"].string,
      title: title,
      summary: self["description"].string,
      url: url,
      imageUrl: self["urlToImage"].string,
      publishedAt: self["publishedAt"].string?.dateFromISO8601,
      tags: tags
    )
  }
  
  func makeArticles(sourceId: String, tags: [Tag] = []) throws -> [Article] {
    let articles = try self["articles"].array?.map {
      try $0.makeArticle(sourceId: sourceId, tags: tags)
    }
    
    return articles ?? []
  }
}
