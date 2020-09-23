import XCTest

public enum ResourceExtension: String {
    case txt = ".txt"
    case pdf = ".pdf"
    case json = ".json"
}

public class Loader {

    /// This method return an object by a given JSON file name.
    /// - Parameters:
    ///   - name: The JSON file name.
    ///   - decoder: The JSONDecoder it will be used to decode. By default it use JSONDecoder.
    ///   - file: The caller file's name. This parameter is used to know in what directory search for the JSON file
    /// - Throws: It can throw 3 errors:
    ///
    ///   * **Failure.loadFixture**: It was unable to find a file by the given name.
    ///   * **Failure.fileCorrupted**: An error in the Cocoa domain, if the file `url` can not be read.
    ///   * **Failure.decodeFailure**: The JSON file can't be decoded to the expected object
    /// - Returns: The object expected by a given JSON file
    public static func fixture<T: Decodable>(_ name: String, decoder: JSONDecoder = JSONDecoder(), _ file: StaticString = #file) throws -> T {
        guard let fileURL = try? resourceURL(for: name, .json, file) else {
            throw Failure.loadFixture
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            throw Failure.fileCorrupted
        }
        guard let object = try? decoder.decode(T.self, from: data) else {
            throw Failure.decodeFailure
        }
        return object
    }

    /// This method return an URL by a given resource file name.
    /// - Parameters:
    ///   - resourceName: The resource file name.
    ///   - resourceExtension: The resource file extensions.
    ///   - file: The caller file's name. This parameter is used to know in what directory search for the resource file
    /// - Throws: It can throw 2 errors:
    ///
    ///   * **Failure.invalidURL**: An error in the Cocoa domain, if the file `url` can not be read.
    ///   * **Failure.notFound**: It was unable to find a resource by the given name.
    /// - Returns: The URL expected by a given resource file
    public static func resourceURL(for resourceName: String, _ resourceExtension: ResourceExtension, _ file: StaticString = #file) throws -> URL {
        let currentFileURL = URL(fileURLWithPath: file.description, isDirectory: false)
        let baseURL = currentFileURL.deletingLastPathComponent()
        let fileManager = FileManager.default
        let fileName = "\(resourceName).\(resourceExtension)"

        guard let enumerator = fileManager.enumerator(at: baseURL, includingPropertiesForKeys: [.nameKey]) else {
            throw Failure.invalidURL
        }

        for case let url as URL in enumerator where url.isFileURL && url.lastPathComponent == fileName {
            return url
        }

        throw Failure.notFound
    }

}
