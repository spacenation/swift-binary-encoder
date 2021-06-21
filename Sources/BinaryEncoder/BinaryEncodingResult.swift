import Foundation

public typealias BinaryEncodingResult = Result<List<Bit>, EncodingError>

public extension BinaryEncodingResult {
    func data() throws -> Data {
        switch self {
        case .success(let result):
            return Data(result.bytes)
        case .failure(let error):
            throw error
        }
    }
}
