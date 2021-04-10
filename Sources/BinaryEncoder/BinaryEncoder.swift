import Foundation
@_exported import Binary
@_exported import Functional

public typealias BinaryEncoder<Element> = Encoder<Element, List<Bit>>
