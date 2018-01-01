import Alamofire

struct EndPoint {
  let path: String
  let method: HTTPMethod
  let headers: [String: String]?
  let parameters: [String: Any]?
  
  init(
    path: String,
    method: HTTPMethod,
    headers: [String: String]? = nil,
    parameters: [String: Any]? = nil)
  {
    self.path = path
    self.method = method
    self.headers = headers
    self.parameters = parameters
  }
}

