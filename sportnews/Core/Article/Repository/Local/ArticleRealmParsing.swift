extension Article {
  func makeRealmObject() -> ArticleRealm {
    let realmObject = ArticleRealm()
    realmObject.sourceId = sourceId
    realmObject.author = author
    realmObject.title = title
    realmObject.summary = summary
    realmObject.url = url
    realmObject.imageUrl = imageUrl
    realmObject.publishedAt = publishedAt
    tags.forEach {
      realmObject.tags.append($0.rawValue)
    }
    return realmObject
  }
}

extension ArticleRealm {
  func makeArticle() -> Article? {
    guard let sourceId = sourceId,
      let title = title,
      let url = url else {
        return nil
    }
    
    return Article(
      sourceId: sourceId,
      author: author,
      title: title,
      summary: summary,
      url: url,
      imageUrl: imageUrl,
      publishedAt: publishedAt,
      tags: tags.flatMap { Tag(rawValue: $0) }
    )
  }
}

