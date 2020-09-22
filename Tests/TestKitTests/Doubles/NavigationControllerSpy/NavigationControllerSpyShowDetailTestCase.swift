import XCTest
@testable import TestKit

final class NavigationControllerSpyShowDetailTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isShowDetailViewControllerCalled)
        XCTAssertNil(sut.showDetailViewController)
    }

    func testShowDetailInWindow() {
        let controllerToShow = UIViewController()
        setInWindow(controller: sut)
        sut.showDetailViewController(controllerToShow, sender: nil)

        XCTAssertEqual(sut.visibleViewController, controllerToShow)
        XCTAssertTrue(sut.isShowDetailViewControllerCalled)
        XCTAssertEqual(sut.showDetailViewController, controllerToShow)
    }

    func testShowDetailNotInWindow() {
        let controllerToShow = UIViewController()
        sut.showDetailViewController(controllerToShow, sender: nil)

        XCTAssertTrue(sut.isShowDetailViewControllerCalled)
        XCTAssertEqual(sut.showDetailViewController, controllerToShow)
    }

}
