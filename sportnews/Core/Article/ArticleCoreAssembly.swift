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
    
    container.register(ArticleLocalRepository.self) { _ in
      ArticleLocalRepositoryImpl(configuration: RealmConfigurations.main)
    }
    .inObjectScope(.container)
    
    container.register (ArticleEventCenter.self) { _ in
      ArticleEventCenter()
    }
    .inObjectScope(.container)

    container.register (ArticleEventSender.self) { resolver in
      resolver.resolve(ArticleEventCenter.self)!
    }
    .inObjectScope(.container)
    
    container.register (ArticleEventReceiver.self) { resolver in
      resolver.resolve(ArticleEventCenter.self)!
    }
    .inObjectScope(.container)
    
    container.register (ArticleUseCase.self) { resolver in
      ArticleUseCaseImpl(
        remoteRepository: resolver.resolve(ArticleRemoteRepositiory.self)!,
        localRepository: resolver.resolve(ArticleLocalRepository.self)!,
        eventSender: resolver.resolve(ArticleEventSender.self)!
      )
    }
    .inObjectScope(.container)
  }
}
