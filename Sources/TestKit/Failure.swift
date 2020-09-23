import Foundation

internal enum Failure: Error, CustomStringConvertible {

    case delegateNotSet
    case loadFixture
    case fileCorrupted
    case decodeFailure
    case notFound
    case invalidURL

    internal var description: String {
        switch self {
        case .delegateNotSet:
            return "Delegate is not set for this object"
        case .loadFixture:
            return "Fixture not found"
        case .fileCorrupted:
            return "Can't create a Data with the resource"
        case .decodeFailure:
            return "Can't decode resource"
        case .notFound:
            return "Not found"
        case .invalidURL:
            return "Invalid URL path"
        }
    }

}
