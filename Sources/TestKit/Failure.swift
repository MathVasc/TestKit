import Foundation

internal enum Failure: Error, CustomStringConvertible {

    case delegateNotSet

    internal var description: String {
        switch self {
        case .delegateNotSet:
            return "Delegate is not set for this object"
        }
    }

}
