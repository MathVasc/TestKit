import UIKit

public extension UIControl {

    /// Use this method to simulate a control event in a especific UIControl.
    /// - Parameter controlEvent: the control event that will be simulated in the UIControl.
    func sendFakeAction(for controlEvent: UIControl.Event) {
        allTargets.forEach { target in
            guard let actions = actions(forTarget: target, forControlEvent: controlEvent),
                let responder = target.base as? NSObject else {
                    return
            }

            actions.map { Selector($0) }.forEach { selector in
                if responder.responds(to: selector) {
                    responder.perform(selector, with: self)
                }
            }
        }
    }

}
