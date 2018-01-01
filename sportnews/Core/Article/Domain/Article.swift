import Foundation

struct Article {
  let id: String
  let sourceId: String
  let author: String?
  let title: String
  let description: String
  let url: String
  let imageUrl: String
  let publishedAt: Date
  let tags: [Tag]
}
