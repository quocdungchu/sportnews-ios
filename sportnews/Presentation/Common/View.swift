import UIKit

protocol View: class {
  associatedtype ViewModelType: ViewModel
  var viewModel: ViewModelType? { get set }
}

extension View {
  func onDidLoad() {
    viewModel?.onDidLoad()
  }
  
  func onWillAppear() {
    viewModel?.onWillAppear()
  }
  
  func onDidDisappear() {
    viewModel?.onDidDisappear()
  }
}

class BaseViewController<ViewModelType: ViewModel>: UIViewController, View {
  
  var viewModel: ViewModelType?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    onDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    onWillAppear()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    onDidDisappear()
  }
}
