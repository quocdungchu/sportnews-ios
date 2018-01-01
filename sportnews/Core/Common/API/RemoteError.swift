struct RemoteError: Error {
  enum Status {
    case authenticationRequired
    case serverFailed
    case badJsonFormat
    case other
  }
  
  let status: Status
  let code: String?
  let message: String?
  
  init(_ status: Status, code: String? = nil, message: String? = nil) {
    self.status = status
    self.code = code
    self.message = message
  }
}

