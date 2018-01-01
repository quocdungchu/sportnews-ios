import Swinject

enum Components {
  private static let assembler: Assembler = {
    return Assembler(
      [
        RemoteAssembly(),
        ArticleCoreAssembly()
      ]
    )
  }()
  
  static func of<ComponentType>(_ type: ComponentType.Type) -> ComponentType {
    return assembler.resolver.resolve(ComponentType.self)!
  }
}
