import UIKit

enum TransitionType {
  case settingRoot
  case pushing
  case presenting
}

enum Transitions {
  static func of(type: TransitionType, source: UIViewController) -> Transition {
    switch type {
    case .settingRoot:
      return TransitionSettingRoot()
    
    case .pushing:
      return TransitionPushing(source)
      
    case .presenting:
      return TransitionPresenting(source)
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
    let navigationController = UINavigationController()
    navigationController.viewControllers = [viewController]
    UIApplication.shared.delegate?.window??.rootViewController = navigationController
  }
  
  func back() {
  }
}

class TransitionPresenting: Transition {
  private weak var source: UIViewController?
  
  init(_ source: UIViewController?){
    self.source = source
  }
  
  func show(_ viewController: UIViewController) {
    source?.present(viewController, animated: true, completion: nil)
  }
  
  func back() {
    if let source = source {
      source.dismiss(animated: true, completion: nil)
    }
  }
}
