protocol ViewModel: class {
  associatedtype WireframeType: Wireframe
  weak var wireframe: WireframeType? { get set }

  func onDidLoad()
  func onWillAppear()
  func onDidDisappear()
}

class BaseViewModel<WireframeType: Wireframe>: ViewModel {
  
  weak var wireframe: WireframeType?
  
  func onDidLoad() {
  }
  
  func onWillAppear() {
  }
  
  func onDidDisappear() {
  }
}
