protocol ViewModel: class {
  func viewDidLoad()
  func viewWillAppear()
  func viewDidDisappear()
}

class BaseViewModel: ViewModel {
  func viewDidLoad() {
  }

  func viewWillAppear() {
  }
  
  func viewDidDisappear() {
  }
}
