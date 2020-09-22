import XCTest
@testable import TestKit

final class UITableViewSendFakeActionsTestCase: XCTestCase {

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
        sut.setTableViewDelegate()
        try sut.tableView.sendFakeAction(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(sut.isTableViewWillSelectRowAtCalled)
        XCTAssertTrue(sut.tableView.isSelectRowCalled)
        XCTAssertTrue(sut.isTableViewDidSelectRowAtCalled)
    }

    func testSelectWithoutDelegate() {
        XCTAssertThrowsError(try sut.tableView.sendFakeAction(at: IndexPath(row: 0, section: 0)))
        XCTAssertFalse(sut.isTableViewWillSelectRowAtCalled)
        XCTAssertFalse(sut.tableView.isSelectRowCalled)
        XCTAssertFalse(sut.isTableViewDidSelectRowAtCalled)
    }

}
