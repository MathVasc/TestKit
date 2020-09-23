import UIKit
import XCTest

/// This class provide a easy and correct way to call a view controller life cycle
public class LifeCycleInvoker {

    private var rootWindow: UIWindow

    /// Initializes and returns a newly allocated LifeCycleInvoker object with the specified window.
    /// - Parameter window: The window where the view controller will be added
    public init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.rootWindow = window
    }

    /// This method will call correctly the appearance methods for the given view controller.
    /// - Parameter viewController: The view controller to appear
    public func appear(viewController: UIViewController) {
        rootWindow.rootViewController = viewController
        rootWindow.makeKeyAndVisible()
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
    }

    /// This method will call correctly the disappearance methods.
    /// - Parameter viewController: The view controller to disappear.
    ///
    ///   The default value is **nil**. This means that it will try to call the disappearance methods of the rootViewController in the window previously setted using the appear method.
    ///   ```
    ///   invoker.appear(viewController: SomeViewController)
    ///   invoker.disapear()
    ///   ```
    ///
    ///   If the appear method was not previously called it will not call the disappearance methods.
    ///
    ///   However, if you pass a viewController it will call its disappearance methods.
    ///   ```
    ///   invoker.disapear(viewController: SomeViewController)
    ///   ```
    public func disapear(viewController: UIViewController? = nil) {
        rootWindow.rootViewController = viewController ?? rootWindow.rootViewController
        rootWindow.rootViewController?.beginAppearanceTransition(false, animated: false)
        rootWindow.rootViewController?.endAppearanceTransition()
        rootWindow.rootViewController = nil
    }

}
