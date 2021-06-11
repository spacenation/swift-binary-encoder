import Foundation
@_exported import Binary
@_exported import Encoder

public typealias BinaryEncoder<Element> = Encoder<Element, List<Bit>>
