import XCTest
@testable import TestKit

final class NavigationControllerSpyPopToRootTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isPopToRootViewControllerCalled)
    }

    func testPopToRootInWindow() {
        setInWindow(controller: sut)
        let controllerToPop = UIViewController()
        sut.pushViewController(controllerToPop, animated: false)
        let controllersPopped = sut.popToRootViewController(animated: false)

        XCTAssertTrue(sut.isPopToRootViewControllerCalled)
        XCTAssertEqual([controllerToPop], controllersPopped)
    }

    func testPopToRootNotInWindow() {
        let controllerToPop = UIViewController()
        sut.pushViewController(controllerToPop, animated: false)
        let controllersPopped = sut.popToRootViewController(animated: false)

        XCTAssertTrue(sut.isPopToRootViewControllerCalled)
        XCTAssertNotEqual([controllerToPop], controllersPopped)
        XCTAssertNil(controllersPopped)
    }

}
