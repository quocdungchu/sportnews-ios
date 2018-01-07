import UIKit

class ArticleCell: UICollectionViewCell {
  
  static let identifier = "ArticleCell"
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  
  var article: Article? {
    didSet {
      guard let article = article else {
        return
      }
      render(article: article)
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    summaryLabel.text = nil
  }
  
  private func render(article: Article) {
    titleLabel.text = article.title
    summaryLabel.text = article.summary
  }
}

