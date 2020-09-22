import XCTest
@testable import TestKit

final class NavigationControllerSpyShowTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isShowCalled)
        XCTAssertNil(sut.showViewController)
    }

    func testShowInWindow() {
        let controllerToShow = UIViewController()
        setInWindow(controller: sut)
        sut.show(controllerToShow, sender: nil)

        XCTAssertEqual(sut.visibleViewController, controllerToShow)
        XCTAssertTrue(sut.isShowCalled)
        XCTAssertEqual(sut.showViewController, controllerToShow)
    }

    func testShowNotInWindow() {
        let controllerToShow = UIViewController()
        sut.show(controllerToShow, sender: nil)
        
        XCTAssertNil(sut.visibleViewController)
        XCTAssertTrue(sut.isShowCalled)
        XCTAssertEqual(sut.showViewController, controllerToShow)
    }

}
