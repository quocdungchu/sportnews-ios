import UIKit

class ArticleListComponent: Component<ArticleListViewController, ArticleListViewModel, ArticleListWireframe> {
  init(section: Section) {
    guard let controller = UIStoryboard(name: "ArticleList", bundle: nil).instantiateInitialViewController() as? ArticleListViewController else {
      fatalError("ArticleListViewController is not in ArticleList storyboard")
    }
    let wireframe = ArticleListWireframeImpl(controller)
    let viewModel = ArticleListViewModel(
      section: section,
      useCase: Components.of(ArticleUseCase.self),
      eventReceiver: Components.of(ArticleEventReceiver.self),
      wireframe: wireframe
    )
    super.init(view: controller, viewModel: viewModel, wireframe: wireframe)
  }
}
