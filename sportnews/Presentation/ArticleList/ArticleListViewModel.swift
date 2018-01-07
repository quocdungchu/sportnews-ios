import RxSwift

class ArticleListViewModel: BaseViewModel {
  
  let articles = Variable<[Article]>([])
  
  private let section: Section
  private let useCase: ArticleUseCase
  private let eventReceiver: ArticleEventReceiver
  private let wireframe: ArticleListWireframe
  
  private let bag = DisposeBag()
  
  init(section: Section, useCase: ArticleUseCase, eventReceiver: ArticleEventReceiver, wireframe: ArticleListWireframe) {
    self.section = section
    self.useCase = useCase
    self.eventReceiver = eventReceiver
    self.wireframe = wireframe
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    articles.value = loadArticles()
  }
  
  private func loadArticles() -> [Article] {
    var theArticles = [Article]()
    Source.allIds.forEach {
      theArticles.append(contentsOf: self.useCase.load(sourceId: $0, section: self.section))
    }
    return theArticles
  }
  
  func openDetail(article: Article) {
    wireframe.navigateToOpen(articleURL: article.url)
  }
}
