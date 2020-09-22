import XCTest
@testable import TestKit

final class NavigationControllerSpySetTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isSetViewControllersCalled)
    }

    func testSetInWindow() {
        let controllersToSet = [UIViewController(),
                                UIViewController(),
                                UIViewController()]
        setInWindow(controller: sut)
        sut.setViewControllers(controllersToSet, animated: false)

        XCTAssertEqual(sut.viewControllers, controllersToSet)
        XCTAssertTrue(sut.isSetViewControllersCalled)
    }

    func testSetNotInWindow() {
        let controllersToSet = [UIViewController(),
                                UIViewController(),
                                UIViewController()]
        sut.setViewControllers(controllersToSet, animated: false)

        XCTAssertNotEqual(sut.viewControllers, controllersToSet)
        XCTAssertTrue(sut.viewControllers.isEmpty)
        XCTAssertTrue(sut.isSetViewControllersCalled)
    }

}
