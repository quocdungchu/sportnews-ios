import SwiftyJSON

extension Source.Id {
  var remoteId: String {
    return rawValue
  }
}

extension JSON {
  func makeArticle(sourceId: String, tags: [Tag] = []) throws -> Article {
    guard let title = self["title"].string,
      let description = self["description"].string,
      let url = self["url"].string,
      let imageUrl = self["urlToImage"].string else
    {
      throw RemoteError(.badJsonFormat)
    }
    
    return Article(
      id: url,
      sourceId: sourceId,
      author: self["author"].string,
      title: title,
      description: description,
      url: url,
      imageUrl: imageUrl,
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
