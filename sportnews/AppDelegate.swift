import RxSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  let bag = DisposeBag()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    HomeComponent().wireframe.showAsRoot()
    
    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    Components.of(ArticleUseCase.self).synchronize()
  }
}

