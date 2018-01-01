import UIKit

class HomeComponent: Component<HomeViewController, HomeViewModel, HomeWireframeImpl> {
  init() {
    guard let controller = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? HomeViewController else {
      fatalError("HomeViewController is not in Home storyboard")
    }
    
    let viewModel = HomeViewModel(articleUseCase: Components.of(ArticleUseCase.self))
    let wireframe = HomeWireframeImpl(controller)

    super.init(view: controller, viewModel: viewModel, wireframe: wireframe)
  }
}

