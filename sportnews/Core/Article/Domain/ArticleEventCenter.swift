import RxSwift

enum ArticleEvent {
  case didDownload(articles: [Article], sourceId: Source.Id, section: Section)
  case didSynchronize
}

protocol ArticleEventSender {
  func send(event: ArticleEvent)
}

protocol ArticleEventReceiver {
  var onReceive: PublishSubject<ArticleEvent> { get }
}

class ArticleEventCenter: ArticleEventReceiver {
  let onReceive = PublishSubject<ArticleEvent>()
}

extension ArticleEventCenter: ArticleEventSender {
  func send(event: ArticleEvent) {
    onReceive.onNext(event)
  }
}


