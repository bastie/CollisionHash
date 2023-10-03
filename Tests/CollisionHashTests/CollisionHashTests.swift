import XCTest
@testable import CollisionHash

final class CollisionHashTests: XCTestCase {
  func testExample() throws {
    let algorithm = CollisionHash()

    var input : (UInt8,UInt8) = (0,0)
    XCTAssertEqual(algorithm.hash(input).1,0,"expected on result.1 is 0")
    input = (127,255)
    XCTAssertEqual(algorithm.hash(input).1,127,"expected on result.1 is 127")
    input = (128,0)
    XCTAssertEqual(algorithm.hash(input).1,128,"expected on result.1 is 128")
    input = (255,255)
    XCTAssertEqual(algorithm.hash(input).1,255,"expected on result.1 is 255")
  }
}

