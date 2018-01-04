import UIKit

protocol Wireframe: class {
  func showAsRoot()
  func show(with transition: Transition)
  func navigate(to wireframe: Wireframe, with transitionType: TransitionType)
  func back()
}

class BaseWireframe {
  private weak var viewController: UIViewController!
  private var transition: Transition?
  
  init(_ viewController: UIViewController) {
    self.viewController = viewController
  }
}

extension BaseWireframe: Wireframe {
  func showAsRoot() {
    show(with: TransitionSettingRoot())
  }
  
  func show(with transition: Transition) {
    self.transition = transition
    transition.show(viewController)
  }
  
  func navigate(to wireframe: Wireframe, with transitionType: TransitionType) {
    wireframe.show(with: Transitions.of(type: transitionType, source: viewController))
  }
  
  func back() {
    transition?.back()
  }
}
