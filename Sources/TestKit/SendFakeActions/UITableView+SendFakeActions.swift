import UIKit

public extension UITableView {

    /// Use this method to simulate a tap in a especific UITableView IndexPath.
    /// - Parameters:
    ///   - indexPath: The IndexPath where the tap will be simulated.
    /// - Throws: If the Table View doesn't have a delegate it will throw an error.
    func sendFakeAction(at indexPath: IndexPath) throws {
        guard let delegate = delegate else {
            throw Failure.delegateNotSet
        }
        _ = delegate.tableView?(self, willSelectRowAt: indexPath)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate.tableView?(self, didSelectRowAt: indexPath)
    }

}
