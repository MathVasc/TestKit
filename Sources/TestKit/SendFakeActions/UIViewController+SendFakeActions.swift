import UIKit

public enum BarButtonItemSide {
    case left
    case right
}

public extension UIViewController {

    /// Use this method to simulate a tap in a UIBarButtonItem in an specific side.
    /// - Parameter buttonSide: The side where the tap will be simulated.
    func sendFakeAction(toBarButtonSide buttonSide: BarButtonItemSide) {
        if let barButton = buttonSide == .left ? navigationItem.leftBarButtonItem : navigationItem.rightBarButtonItem {
            sendFakeAction(toBarButton: barButton)
        }
    }

    /// Use this method to simulate a tap in a specific UIBarButtonItem.
    /// - Parameter barButton: The UIBarButtonItem where the tap will be simulated.
    func sendFakeAction(toBarButton barButton: UIBarButtonItem) {
        if let customButton = barButton.customView as? UIButton {
            customButton.sendFakeAction(for: .touchUpInside)
        } else {
            _ = barButton.target?.perform(barButton.action, with: barButton)
        }
    }

}
