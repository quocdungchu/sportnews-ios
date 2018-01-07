import RealmSwift

class ArticleRealm: Object {
  @objc dynamic var sourceId: String?
  @objc dynamic var author: String?
  @objc dynamic var title: String?
  @objc dynamic var summary: String?
  @objc dynamic var url: String?
  @objc dynamic var imageUrl: String?
  @objc dynamic var publishedAt: Date?
  var tags = List<String>()
  
  override class func primaryKey() -> String? {
    return "url"
  }
}
