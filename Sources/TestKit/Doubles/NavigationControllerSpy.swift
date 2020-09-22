import UIKit

/**
    An UINavigationController that captures the navigation methods calls.

    Use this class in a test to validate some navigation

    # Code
    ```
    // sut is some Controller
    func testSomeNavigation() {
        let navigationSpy = NavigationControllerSpy(rootViewController: sut)
        sut.makeSomePushNavigation()

        XCTAssertTrue(navigationSpy.isPushViewControllerCalled)
    }
    ```

    # Hint
    The original navigation methods will only be called if the navigation view is in some window.

    ```
    let window = UIWindow()
    window.rootViewController = navigationControllerSpy
    window.makeKeyAndVisible()
    ```
*/
public class NavigationControllerSpy: UINavigationController {

    public private(set) var isPresentCalled: Bool
    public private(set) var isDismissCalled: Bool
    public private(set) var isShowCalled: Bool
    public private(set) var isShowDetailViewControllerCalled: Bool
    public private(set) var isPushViewControllerCalled: Bool
    public private(set) var isPopViewControllerCalled: Bool
    public private(set) var isSetViewControllersCalled: Bool
    public private(set) var isPopToRootViewControllerCalled: Bool
    public private(set) var isPopToViewControllerCalled: Bool

    public private(set) var presentViewController: UIViewController?
    public private(set) var showViewController: UIViewController?
    public private(set) var showDetailViewController: UIViewController?
    public private(set) var pushViewController: UIViewController?

    internal var isInWindow: Bool {
        return view.window != nil
    }

    public init() {
        isPresentCalled = false
        isDismissCalled = false
        isShowCalled = false
        isShowDetailViewControllerCalled = false
        isPushViewControllerCalled = false
        isPopViewControllerCalled = false
        isSetViewControllersCalled = false
        isPopToRootViewControllerCalled = false
        isPopToViewControllerCalled = false
        super.init(nibName: nil, bundle: nil)
    }

    public convenience override init(rootViewController: UIViewController) {
        self.init()
        super.setViewControllers([rootViewController], animated: false)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        isPresentCalled = true
        presentViewController = viewControllerToPresent

        if isInWindow {
            super.present(viewControllerToPresent, animated: false, completion: completion)
        }
    }

    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissCalled = true

        if isInWindow {
            super.dismiss(animated: false)
            completion?()
        }
    }

    override public func show(_ vc: UIViewController, sender: Any?) {
        isShowCalled = true
        showViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override public func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        isShowDetailViewControllerCalled = true
        showDetailViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushViewControllerCalled = true
        pushViewController = viewController

        if isInWindow {
            super.pushViewController(viewController, animated: false)
        }
    }

    override public func popViewController(animated: Bool) -> UIViewController? {
        isPopViewControllerCalled = true

        if isInWindow {
            return super.popViewController(animated: false)
        }

        return nil
    }

    override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        isPopToRootViewControllerCalled = true

        if isInWindow {
            return super.popToRootViewController(animated: false)
        }

        return nil
    }

    override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        isPopToViewControllerCalled = true

        if isInWindow {
            return super.popToViewController(viewController, animated: false)
        }

        return nil
    }

    override public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        isSetViewControllersCalled = true

        if isInWindow {
            super.setViewControllers(viewControllers, animated: false)
        }
    }

}
