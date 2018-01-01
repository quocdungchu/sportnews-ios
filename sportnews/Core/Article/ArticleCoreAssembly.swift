import Alamofire
import Swinject

class ArticleCoreAssembly: Assembly {
  func assemble(container: Container) {
    container.register (ArticleRemoteRepositiory.self) { resolver in
      ArticleRemoteRepositioryImpl(
        baseURL: resolver.resolve(String.self, name: RemoteAssembly.Constants.baseURL)!,
        apiKey: resolver.resolve(String.self, name: RemoteAssembly.Constants.apiKey)!,
        sessionManager: resolver.resolve(SessionManager.self)!
      )
    }
    .inObjectScope(.container)
    
    container.register (ArticleUseCase.self) { resolver in
      ArticleUseCaseImpl(
        remoteRepository: resolver.resolve(ArticleRemoteRepositiory.self)!
      )
    }
    .inObjectScope(.container)
  }
}
