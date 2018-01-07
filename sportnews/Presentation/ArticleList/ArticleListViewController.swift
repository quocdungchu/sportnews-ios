import RxSwift
import UIKit

class ArticleListViewController: BaseViewController<ArticleListViewModel>, UICollectionViewDataSource, UICollectionViewDelegate {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  private let bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupBindings()
  }
  
  private func setupViews() {
    collectionView.register(
      UINib(nibName: ArticleCell.identifier, bundle: nil),
      forCellWithReuseIdentifier: ArticleCell.identifier
    )
    
    (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: view.frame.size.width, height: 120)
  }
  
  private func setupBindings() {
    viewModel.articles.asObservable().subscribe { [unowned self] in
        self.collectionView.reloadData()
      }
      .disposed(by: bag)
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.articles.value.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
    cell.article = viewModel.articles.value[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.openDetail(article: viewModel.articles.value[indexPath.item])
  }
}
