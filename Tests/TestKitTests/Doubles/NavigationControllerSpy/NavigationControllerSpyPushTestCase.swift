import XCTest
@testable import TestKit

final class NavigationControllerSpyPushTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isPushViewControllerCalled)
        XCTAssertNil(sut.pushViewController)
    }

    func testPushInWindow() {
        let controllerToPush = UIViewController()
        setInWindow(controller: sut)
        sut.pushViewController(controllerToPush, animated: false)

        XCTAssertEqual(sut.viewControllers.first, controllerToPush)
        XCTAssertTrue(sut.isPushViewControllerCalled)
        XCTAssertEqual(sut.pushViewController, controllerToPush)
    }

    func testPushNotInWindow() {
        let controllerToPush = UIViewController()
        sut.pushViewController(controllerToPush, animated: false)

        XCTAssertNil(sut.viewControllers.first)
        XCTAssertTrue(sut.isPushViewControllerCalled)
        XCTAssertEqual(sut.pushViewController, controllerToPush)
    }

}
