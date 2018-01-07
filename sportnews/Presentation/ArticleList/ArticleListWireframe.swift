import UIKit
import SafariServices

protocol ArticleListWireframe: Wireframe {
  func navigateToOpen(articleURL: String)
}

class ArticleListWireframeImpl: BaseWireframe, ArticleListWireframe {
  func navigateToOpen(articleURL: String) {
    guard let url = URL(string: articleURL) else {
      return
    }
    let config = SFSafariViewController.Configuration()
    config.entersReaderIfAvailable = false
    let viewController = SFSafariViewController(url: url, configuration: config)
    let wireframe = BaseWireframe(viewController)
    
    navigate(to: wireframe, with: .presenting)
  }
}
