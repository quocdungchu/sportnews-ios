struct Source {
  enum Id: String {
    case espn = "espn"
  }
  
  static let allIds: [Id] = [.espn]
  
  let id: Id
  let name: String
}
