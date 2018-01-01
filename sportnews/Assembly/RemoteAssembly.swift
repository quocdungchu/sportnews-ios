import Alamofire
import Swinject

class RemoteAssembly: Assembly {
  enum Constants {
    static let baseURL = "baseURL"
    static let apiKey = "apiKey"
  }
  
  func assemble(container: Container) {
    container.register (String.self, name: Constants.baseURL) { _ in
      "https://newsapi.org/v2"
    }
    .inObjectScope(.container)
    
    container.register (String.self, name: Constants.apiKey) { _ in
      "26826ce07f424a69b00233814d0ebec3"
    }
    .inObjectScope(.container)
    
    container.register (SessionManager.self) { _ in
      SessionManagers.background
    }
    .inObjectScope(.container)
  }
}
