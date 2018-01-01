import Nimble
import XCTest
@testable import sportnews

class DateISO8601Tests: XCTestCase {
  func testStringToDate() {
    expect("2018-01-01T19:00:00Z".dateFromISO8601).notTo(beNil())
  }
}
