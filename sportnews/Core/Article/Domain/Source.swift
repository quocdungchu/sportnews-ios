struct Source {
  enum Id: String {
    case espn = "espn"
  }
  
  let id: Id
  let name: String
}
