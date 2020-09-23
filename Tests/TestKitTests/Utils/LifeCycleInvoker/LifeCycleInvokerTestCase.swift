import XCTest
@testable import TestKit

class LifeCycleInvokerTestCase: XCTestCase {

    var sut: LifeCycleInvoker!
    var viewControllerSpy: UIViewControllerSpy!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        sut = LifeCycleInvoker(window: window)
        viewControllerSpy = UIViewControllerSpy()
    }

    override func tearDown() {
        window = nil
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }

    func testAppear() {
        sut.appear(viewController: viewControllerSpy)

        XCTAssertNotNil(viewControllerSpy.view.window)
        XCTAssertEqual(viewControllerSpy.view.window, window)
        XCTAssertEqual(viewControllerSpy, window.rootViewController)
        XCTAssertTrue(viewControllerSpy.isLoadViewCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidLoadCalled)
        XCTAssertTrue(viewControllerSpy.isViewWillAppearCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidAppearCalled)
        XCTAssertFalse(viewControllerSpy.isViewWillDisappearCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidDisappearCalled)
    }

    func testDisapearAfterAppear() {
        sut.appear(viewController: viewControllerSpy)
        sut.disapear()

        XCTAssertTrue(viewControllerSpy.isLoadViewCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidLoadCalled)
        XCTAssertTrue(viewControllerSpy.isViewWillAppearCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidAppearCalled)
        XCTAssertTrue(viewControllerSpy.isViewWillDisappearCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidDisappearCalled)
        XCTAssertNil(viewControllerSpy.view.window)
        XCTAssertNil(window.rootViewController)
    }

    func testDisapearWithController() {
        sut.disapear(viewController: viewControllerSpy)

        XCTAssertFalse(viewControllerSpy.isLoadViewCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidLoadCalled)
        XCTAssertFalse(viewControllerSpy.isViewWillAppearCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidAppearCalled)
        XCTAssertTrue(viewControllerSpy.isViewWillDisappearCalled)
        XCTAssertTrue(viewControllerSpy.isViewDidDisappearCalled)
        XCTAssertNil(viewControllerSpy.view.window)
        XCTAssertNil(window.rootViewController)
    }

    func testDisapearWithoutAppear() {
        sut.disapear()

        XCTAssertFalse(viewControllerSpy.isLoadViewCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidLoadCalled)
        XCTAssertFalse(viewControllerSpy.isViewWillAppearCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidAppearCalled)
        XCTAssertFalse(viewControllerSpy.isViewWillDisappearCalled)
        XCTAssertFalse(viewControllerSpy.isViewDidDisappearCalled)
        XCTAssertNil(viewControllerSpy.view.window)
        XCTAssertNil(window.rootViewController)
    }

}

