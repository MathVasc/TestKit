import XCTest
@testable import TestKit

final class UIControllSendFakeActionsTestCase: XCTestCase {

    var sut: FakeActionsViewSpy!

    override func setUp() {
        super.setUp()
        sut = FakeActionsViewSpy()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAction() {
        sut.setButtonAction()
        sut.button.sendFakeAction(for: .touchUpInside)

        XCTAssertTrue(sut.isButtonActionCalled)
    }

    func testSenderAction() {
        sut.setButtonAction()
        sut.senderButton.sendFakeAction(for: .touchUpInside)

        XCTAssertTrue(sut.isButtonActionCalled)
        XCTAssertEqual(sut.senderReceived, sut.senderButton)
    }

    func testWithoutAction() {
        sut.button.sendFakeAction(for: .touchUpInside)

        XCTAssertFalse(sut.isButtonActionCalled)
    }

}
