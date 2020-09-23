import UIKit

class ActionsViewControllerSpy: UIViewController {

    private(set) var isActionCalled = false

    func addActionBackButton() {
        let button = UIButton()
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(action))
    }

    @objc private func action() {
        isActionCalled = true
    }

}
