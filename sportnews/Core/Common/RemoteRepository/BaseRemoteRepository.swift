import Alamofire

class BaseRemoteRepository {
  
  let baseURL: String
  let apiKey: String
  let sessionManager: SessionManager
  
  init(baseURL: String, apiKey: String, sessionManager: SessionManager) {
    self.baseURL = baseURL
    self.apiKey = apiKey
    self.sessionManager = sessionManager
  }
}
