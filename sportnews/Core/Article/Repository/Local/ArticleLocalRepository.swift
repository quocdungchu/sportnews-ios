import RealmSwift

protocol ArticleLocalRepository {
  func save(articles: [Article], for sourceId: Source.Id)
  func loadArticles(for sourceId: Source.Id) -> [Article]
}

class ArticleLocalRepositoryImpl {
  let configuration: Realm.Configuration
  
  init(configuration: Realm.Configuration) {
    self.configuration = configuration
  }
  
  func createRealm() -> Realm {
    do {
      return try Realm(configuration: configuration)
      
    } catch {
      fatalError("There is something wrong with Realm configuration")
    }
  }
}

extension ArticleLocalRepositoryImpl: ArticleLocalRepository {
  func save(articles: [Article], for sourceId: Source.Id) {
    let realm = createRealm()
    try? realm.write {
      articles.map { $0.makeRealmObject() }
        .forEach {
          realm.add($0, update: true)
      }
    }
  }
  
  func loadArticles(for sourceId: Source.Id) -> [Article] {
    return createRealm().objects(ArticleRealm.self)
      .filter("sourceId == %@", sourceId.rawValue)
      .flatMap { $0.makeArticle() }
  }
}
