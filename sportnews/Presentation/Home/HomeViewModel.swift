import RxSwift

class HomeViewModel: BaseViewModel<HomeWireframeImpl> {
  
  private let articleUseCase: ArticleUseCase
  
  private let bag = DisposeBag()
  
  init(articleUseCase: ArticleUseCase) {
    self.articleUseCase = articleUseCase
  }
  
  override func onWillAppear() {
    super.onWillAppear()
    articleUseCase.load(sourceId: .espn, option: .topHeadlines)
      .subscribe(onSuccess: {
        print("\($0)")
      })
      .disposed(by: bag)
  }
}

