import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

protocol API {
  var endPoint: EndPoint { get }
}

extension API {
  
  private var defaultHeaders: [String: String] {
    return ["Content-Type": "application/json"]
  }
  
  func fetchJson(at baseURL: String, with sessionManager: SessionManager) -> Single<JSON> {
    
    let theEndPoint = endPoint
    var theHeaders = defaultHeaders
    
    theEndPoint.headers?.forEach { key, value in
      theHeaders[key] = value
    }
    
    return sessionManager.rx.responseData(
      endPoint.method,
      RequestURL(baseURL: baseURL, path: endPoint.path),
      parameters: theEndPoint.parameters,
      encoding: JSONEncoding.default,
      headers: theHeaders
      )
      .map { (httpResponse, data) in
        
        switch httpResponse.statusCode {
        case 200..<400:
          return JSON(data)
          
        case 401, 403:
          let json = JSON(data)
          throw RemoteError(
            .authenticationRequired,
            code: json["code"].string,
            message: json["message"].string)
          
        case 400..<500:
          let json = JSON(data)
          throw RemoteError(
            .other,
            code: json["code"].string,
            message: json["message"].string)
          
        default:
          let json = JSON(data)
          throw RemoteError(
            .serverFailed,
            code: json["code"].string,
            message: json["message"].string)
        }
      }
      .asSingle()
  }
}

fileprivate struct RequestURL: URLConvertible {
  
  let baseURL: String
  let path: String
  
  func asURL() -> URL {
    return URL(string: baseURL + path)!
  }
}
