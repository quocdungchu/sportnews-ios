import UIKit

enum TransitionType {
  case settingRoot
  case pushing
}

enum Transitions {
  static func of(type: TransitionType, source: UIViewController) -> Transition {
    switch type {
    case .settingRoot:
      return TransitionSettingRoot()
    
    case .pushing:
      return TransitionPushing(source)
    }
  }
}

protocol Transition {
  func show(_ viewController: UIViewController)
  func back()
}

class TransitionPushing: Transition {
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

class TransitionSettingRoot: Transition {
  func show(_ viewController: UIViewController) {
    UIApplication.shared.delegate?.window??.rootViewController = viewController
  }
  
  func back() {
  }
}
