import XCTest
@testable import TestKit

final class NavigationControllerSpyPresentTestCase: NavigationControllerSpyBaseTestCase {

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
        XCTAssertFalse(sut.isPresentCalled)
        XCTAssertNil(sut.presentViewController)
    }

    func testPresentInWindow() {
        let controllerToPresent = UIViewController()
        setInWindow(controller: sut)
        sut.present(controllerToPresent, animated: false)

        XCTAssertEqual(sut.visibleViewController, controllerToPresent)
        XCTAssertTrue(sut.isPresentCalled)
        XCTAssertEqual(sut.presentViewController, controllerToPresent)
    }

    func testPresentNotInWindow() {
        let controllerToPresent = UIViewController()
        sut.present(controllerToPresent, animated: false)
        
        XCTAssertNil(sut.visibleViewController)
        XCTAssertTrue(sut.isPresentCalled)
        XCTAssertEqual(sut.presentViewController, controllerToPresent)
    }

}
