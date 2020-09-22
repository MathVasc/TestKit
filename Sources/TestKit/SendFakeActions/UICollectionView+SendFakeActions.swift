import UIKit

public extension UICollectionView {

    /// Use this method to simulate a tap in a especific UICollectionView IndexPath.
    /// - Parameters:
    ///   - indexPath: The IndexPath where the tap will be simulated.
    /// - Throws: If the Collection View doesn't have a delegate it will throw an error.
    func sendFakeAction(at indexPath: IndexPath) throws {
        guard let delegate = delegate else {
            throw Failure.delegateNotSet
        }

        delegate.collectionView?(self, didSelectItemAt: indexPath)
    }

}
