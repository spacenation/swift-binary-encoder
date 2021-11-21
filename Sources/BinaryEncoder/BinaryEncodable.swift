import Foundation
@_exported import Binary
@_exported import Functions
@_exported import Currying
@_exported import List

public protocol BinaryEncodable {
    static var binaryEncoder: BinaryEncoder<Self> { get }
}

public extension BinaryEncodable {
    var binaryEncoded: BinaryEncoderResult {
        Self.binaryEncoder(self)
    }
}
