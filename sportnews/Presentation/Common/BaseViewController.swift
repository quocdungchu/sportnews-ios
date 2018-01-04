import UIKit

protocol View: class {
  associatedtype ViewModelType: ViewModel
  var viewModel: ViewModelType! { get set }
}

class BaseViewController<ViewModelType: ViewModel>: UIViewController, View {
  var viewModel: ViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.onDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.onWillAppear()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewModel.onDidDisappear()
  }
}
