import UIKit

class HomeComponent: Component<HomeViewController, HomeViewModel, HomeWireframe> {
  init() {
    guard let controller = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? HomeViewController else {
      fatalError("HomeViewController is not in Home storyboard")
    }
    let wireframe = HomeWireframeImpl(controller)

    let viewModel = HomeViewModel(
      useCase: Components.of(ArticleUseCase.self),
      eventReceiver: Components.of(ArticleEventReceiver.self),
      wireframe: wireframe
    )

    super.init(view: controller, viewModel: viewModel, wireframe: wireframe)
  }
}

