import Foundation
import Binary

public var bool: BinaryEncoder<Bool> {
    BinaryEncoder { input in
        Result<List<Bit>, EncodingFailure>.success(input ? [.one] : [.zero])
    }
}
