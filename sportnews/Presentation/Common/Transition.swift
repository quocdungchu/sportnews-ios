import UIKit

enum TransitionType {
  case push
}

enum Transitions {
  static func of(type: TransitionType, source: UIViewController) -> Transition {
    switch type {
    case .push:
      return TransitionPush(source)
    }
  }
}

protocol Transition {
  func show(_ viewController: UIViewController)
  func back()
}

class TransitionPush: Transition {
  private weak var source: UIViewController?
  
  init(_ source: UIViewController?){
    self.source = source
  }
  
  func show(_ viewController: UIViewController) {
    source?.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func back() {
    if let source = source {
      source.navigationController?.popToViewController(source, animated: true)
    }
  }
}
