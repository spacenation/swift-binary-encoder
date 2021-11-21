import Foundation
import Binary

public var bool: BinaryEncoder<Bool> {
    BinaryEncoder { input in
        Result<List<Bit>, BinaryEncoderFailure>.success(input ? [.one] : [.zero])
    }
}
