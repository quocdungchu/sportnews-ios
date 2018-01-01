import Alamofire

enum SessionManagers {
  
  static var background: SessionManager {
    let configuration = URLSessionConfiguration.background(withIdentifier: "background")
    configuration.httpShouldSetCookies = false
    return SessionManager(configuration: configuration)
  }
}

