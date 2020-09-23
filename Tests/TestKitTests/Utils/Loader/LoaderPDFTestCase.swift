import XCTest
@testable import TestKit

final class LoaderPDFTestCase: XCTestCase {

    func testSuccessPDFURL() throws {
        XCTAssertNoThrow(try Loader.resourceURL(for: "PDFFile", .pdf))
    }

    func testFailurePDFURL() throws {
        XCTAssertThrowsError(try Loader.resourceURL(for: "NotPDFFile", .pdf)) { error in
            XCTAssertEqual(error as? Failure, Failure.notFound)
        }
    }

}
