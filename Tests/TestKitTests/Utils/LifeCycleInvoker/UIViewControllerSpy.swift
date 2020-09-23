import UIKit

class UIViewControllerSpy: UIViewController {

    private(set) var isLoadViewCalled = false
    private(set) var isViewDidLoadCalled = false
    private(set) var isViewWillAppearCalled = false
    private(set) var isViewDidAppearCalled = false
    private(set) var isViewWillDisappearCalled = false
    private(set) var isViewDidDisappearCalled = false

    override func loadView() {
        super.loadView()
        isLoadViewCalled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isViewDidLoadCalled = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        isViewWillAppearCalled = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        isViewDidAppearCalled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        isViewWillDisappearCalled = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        isViewDidDisappearCalled = true
    }

}

