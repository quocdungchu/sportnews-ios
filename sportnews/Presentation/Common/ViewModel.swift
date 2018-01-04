protocol ViewModel: class {
  func onDidLoad()
  func onWillAppear()
  func onDidDisappear()
}

class BaseViewModel: ViewModel {
  func onDidLoad() {
  }

  func onWillAppear() {
  }
  
  func onDidDisappear() {
  }
}
