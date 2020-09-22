import XCTest

class NavigationControllerSpyBaseTestCase: XCTestCase {

    func setInWindow(controller: UIViewController) {
        let window = UIWindow()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

}
