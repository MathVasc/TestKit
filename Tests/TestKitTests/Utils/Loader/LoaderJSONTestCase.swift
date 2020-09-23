import XCTest
@testable import TestKit

final class LoaderJSONTestCase: XCTestCase {

    func testSuccessJSONFixture() throws {
        let codableDummy: CodableDummy = try Loader.fixture("JSONFile")
        XCTAssertNotNil(codableDummy)
    }

    func testFailureJSONFixture() throws {
        XCTAssertThrowsError(try Loader.fixture("NotAJSONFile") as CodableDummy) { error in
            XCTAssertEqual(error as? Failure, Failure.loadFixture)
        }
    }

    func testFailureDecodeFixture() throws {
        XCTAssertThrowsError(try Loader.fixture("JSONFile") as String) { error in
            XCTAssertEqual(error as? Failure, Failure.decodeFailure)
        }
    }

}

internal struct CodableDummy: Decodable {

    internal var someString: String

}
