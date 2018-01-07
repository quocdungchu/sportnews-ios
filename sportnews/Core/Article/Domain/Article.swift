import Foundation

struct Article {
  let sourceId: String
  let author: String?
  let title: String
  let summary: String?
  let url: String
  let imageUrl: String?
  let publishedAt: Date?
  let tags: [Tag]
}
