import Foundation
import Binary

public var bool: BinaryEncoder<Bool> {
    BinaryEncoder { input in
        .success(input ? [.one] : [.zero])
    }
}
