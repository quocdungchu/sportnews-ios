import RxSwift

class HomeViewModel: BaseViewModel {
  
  let didTopHealinesArticlesLoad = PublishSubject<[Article]>()
  let didAllRecentArticlesLoad = PublishSubject<[Article]>()
  
  private let useCase: ArticleUseCase
  private let eventReceiver: ArticleEventReceiver
  private let wireframe: HomeWireframe
  
  private let bag = DisposeBag()
    
  init(useCase: ArticleUseCase, eventReceiver: ArticleEventReceiver, wireframe: HomeWireframe) {
    self.useCase = useCase
    self.eventReceiver = eventReceiver
    self.wireframe = wireframe
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    eventReceiver.onReceive.observeOn(MainScheduler.instance)
      .subscribe(onNext: { event in
        switch event {
        case .didLoad(let articles, let sourceId, let option):
          print("articles \(articles)")
          print("sourceId \(sourceId)")
          print("option \(option)")
        }
      })
      .disposed(by: bag)
  }
}

