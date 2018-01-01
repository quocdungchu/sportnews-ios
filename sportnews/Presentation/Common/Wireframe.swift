import UIKit

protocol Wireframe {
  func show(with transition: Transition)
  func navigate(to wireframe: Wireframe, with transitionType: TransitionType)
  func back()
}

class BaseWireframe {
  weak var viewController: UIViewController?
  private var transition: Transition?
}

extension BaseWireframe: Wireframe {
  func show(with transition: Transition) {
    guard let viewController = viewController else { return }
    self.transition = transition
    transition.show(viewController)
  }
  
  func navigate(to wireframe: Wireframe, with transitionType: TransitionType) {
    guard let source = viewController else { return }
    wireframe.show(with: Transitions.of(type: transitionType, source: source))
  }
  
  func back() {
    transition?.back()
  }
}
