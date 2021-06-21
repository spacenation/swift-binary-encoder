import Foundation
@_exported import Binary
@_exported import Encoder

public typealias BinaryEncoder<Element> = Encoder<Element, Bit>

public protocol BinaryEncodable {
    static var binaryEncoder: BinaryEncoder<Self> { get }
}

public extension BinaryEncodable {
    var binaryEncoded: BinaryEncodingResult {
        Self.binaryEncoder(self)
    }
}
