import XCTest
@testable import TestKit

class UIViewControllerSendFakeActionsTestCase: XCTestCase {

    var sut: ActionsViewControllerSpy!

    override func setUp() {
        super.setUp()
        sut = ActionsViewControllerSpy()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testBarItemAction() {
        let _ = UINavigationController(rootViewController: sut)
        sut.addActionBackButton()
        sut.sendFakeAction(toBarButtonSide: .right)

        XCTAssertTrue(sut.isActionCalled)
    }

    func testCustomViewBarItemAction() {
        let _ = UINavigationController(rootViewController: sut)
        sut.addActionBackButton()
        sut.sendFakeAction(toBarButtonSide: .left)

        XCTAssertTrue(sut.isActionCalled)
    }

    func testSpecificBarItemAction() throws {
        let _ = UINavigationController(rootViewController: sut)
        sut.addActionBackButton()
        let barButton = try XCTUnwrap(sut.navigationItem.leftBarButtonItem)
        sut.sendFakeAction(toBarButton: barButton)

        XCTAssertTrue(sut.isActionCalled)
    }

}
