import XCTest
@testable import TestKit

final class NavigationControllerSpyDimissTestCase: NavigationControllerSpyBaseTestCase {

    var sut: NavigationControllerSpy!

    override func setUp() {
        super.setUp()
        sut = NavigationControllerSpy()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDefaultValues() {
        XCTAssertFalse(sut.isDismissCalled)
    }

    func testDismissInWindow() {
        setInWindow(controller: sut)
        sut.present(UIViewController(), animated: false)
        var dismissCompletionCalled = false
        sut.dismiss(animated: false) {
            dismissCompletionCalled = true
        }
        
        XCTAssertTrue(dismissCompletionCalled)
        XCTAssertTrue(sut.isDismissCalled)
        XCTAssertEqual(sut.viewControllers.count, 0)
    }

    func testDismissNotInWindow() {
        var dismissCompletionCalled = false
        sut.dismiss(animated: false) {
            dismissCompletionCalled = true
        }
        
        XCTAssertFalse(dismissCompletionCalled)
        XCTAssertTrue(sut.isDismissCalled)
    }

}
