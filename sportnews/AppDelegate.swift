import RxSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let bag = DisposeBag()
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      Components.of(ArticleUseCase.self).load(sourceId: .espn, option: .topHeadlines)
        .subscribe(onSuccess: { articles in
          print("\(articles)")
        })
        .disposed(by: bag)
      
      return true
    }
}

