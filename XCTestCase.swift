import XCTest

/*
XCTAssertEqual
XCTAssert(false, "Error \(rerror.description)")
XCTAssertGreaterThan
XCTAssertGreaterThanOrEqual
XCTAssertLessThan
XCTAssertLessThanOrEqual
XCTAssertNotEqual
XCTAssertNotNil
XCTAssertNil
XCTFail
XCTAssertEqualWithAccuracy
*/

class Interview_Test: XCTestCase {

    private static let ProblemName: String = ""
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

     func testExample() {
    let app = XCUIApplication()
    app.buttons["Button"].tap()
    
    let lbl = app.staticTexts["Label"]
    XCTAssert(lbl.exists == false)
  }


let expectation = expectationWithDescription("\(username)")
  敘述會出現在log
  
  expectation.fulfill()