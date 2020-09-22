import XCTest
@testable import TestKit

final class UICollectionViewSendFakeActionsTestCase: XCTestCase {

    var sut: FakeActionsViewSpy!

    override func setUp() {
        super.setUp()
        sut = FakeActionsViewSpy()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSelect() throws {
        sut.setCollectionViewDelegate()
        try sut.collectionView.sendFakeAction(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(sut.isCollectionViewDidSelectRowAtCalled)
    }

    func testSelectWithoutDelegate() throws {
        XCTAssertThrowsError(try sut.collectionView.sendFakeAction(at: IndexPath(row: 0, section: 0))) { error in
            XCTAssertEqual(error as? Failure, Failure.delegateNotSet)
        }
        XCTAssertFalse(sut.isCollectionViewDidSelectRowAtCalled)
    }

}
