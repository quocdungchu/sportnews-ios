import UIKit

protocol View: class {
  associatedtype ViewModelType: ViewModel
  var viewModel: ViewModelType! { get set }
}

class BaseViewController<ViewModelType: ViewModel>: UIViewController, View {
  var viewModel: ViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.viewWillAppear()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewModel.viewDidDisappear()
  }
}
