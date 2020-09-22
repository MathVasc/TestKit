import XCTest
@testable import TestKit

final class NavigationControllerSpyPopTestCase: NavigationControllerSpyBaseTestCase {

    var sut: NavigationControllerSpy!

    override func setUp() {
        super.setUp()
        sut = NavigationControllerSpy(rootViewController: UIViewController())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDefaultValues() {
        XCTAssertFalse(sut.isPopViewControllerCalled)
    }

    func testPopInWindow() {
        setInWindow(controller: sut)
        let controllerToPop = UIViewController()
        sut.pushViewController(controllerToPop, animated: false)
        let controllerPopped = sut.popViewController(animated: false)

        XCTAssertTrue(sut.isPopViewControllerCalled)
        XCTAssertEqual(controllerToPop, controllerPopped)
    }

    func testPopNotInWindow() {
        let controllerToPop = UIViewController()
        sut.pushViewController(controllerToPop, animated: false)
        let controllerPopped = sut.popViewController(animated: false)

        XCTAssertTrue(sut.isPopViewControllerCalled)
        XCTAssertNotEqual(controllerToPop, controllerPopped)
        XCTAssertNil(controllerPopped)
    }

}
