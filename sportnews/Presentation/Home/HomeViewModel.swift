import RxSwift

class HomeViewModel: BaseViewModel {
  
  private let articleUseCase: ArticleUseCase
  private let wireframe: HomeWireframe
  
  private let bag = DisposeBag()
    
  init(articleUseCase: ArticleUseCase, wireframe: HomeWireframe) {
    self.articleUseCase = articleUseCase
    self.wireframe = wireframe
  }
  
  override func onWillAppear() {
    super.onWillAppear()
    articleUseCase.load(sourceId: .espn, option: .topHeadlines)
      .subscribe(
        onSuccess: {
          print("\($0)")
        },
        onError: {
          print("\($0)")
        }
      )
      .disposed(by: bag)
  }
}

