import XCTest
@testable import TestKit

final class NavigationControllerSpyPopToViewTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isPopToViewControllerCalled)
    }

    func testPopToViewInWindow() {
        setInWindow(controller: sut)
        let controllerToPop = UIViewController()
        let controllersToPush = [UIViewController(),
                                 UIViewController(),
                                 UIViewController()]
        sut.pushViewController(controllerToPop, animated: false)
        controllersToPush.forEach { sut.pushViewController($0, animated: false) }
        let controllersPopped = sut.popToViewController(controllerToPop, animated: false)

        XCTAssertTrue(sut.isPopToViewControllerCalled)
        XCTAssertEqual(controllersToPush, controllersPopped)
        XCTAssertEqual(sut.viewControllers.last, controllerToPop)
    }

    func testPopToViewNotInWindow() {
        let controllerToPop = UIViewController()
        let controllersToPush = [UIViewController(),
                                 UIViewController(),
                                 UIViewController()]
        sut.pushViewController(controllerToPop, animated: false)
        controllersToPush.forEach { sut.pushViewController($0, animated: false) }
        let controllersPopped = sut.popToViewController(controllerToPop, animated: false)

        XCTAssertTrue(sut.isPopToViewControllerCalled)
        XCTAssertNotEqual(controllersToPush, controllersPopped)
        XCTAssertNil(controllersPopped)
    }

}
