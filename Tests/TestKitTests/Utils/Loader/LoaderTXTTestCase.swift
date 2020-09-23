import XCTest
@testable import TestKit

final class LoaderTXTTestCase: XCTestCase {

    func testSuccessPDFURL() throws {
        XCTAssertNoThrow(try Loader.resourceURL(for: "TXTFile", .txt))
    }

    func testFailurePDFURL() throws {
        XCTAssertThrowsError(try Loader.resourceURL(for: "NotTXTFile", .txt)) { error in
            XCTAssertEqual(error as? Failure, Failure.notFound)
        }
    }

}
