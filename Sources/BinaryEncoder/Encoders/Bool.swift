import Foundation
import Binary

public var bool: BinaryEncoder<Bool> {
    BinaryEncoder { input in
        .success(input ? [.one] : [.zero])
    }
}

public var zero: BinaryEncoder<Void> {
    BinaryEncoder { input in
        .success([.zero])
    }
}

public var one: BinaryEncoder<Void> {
    BinaryEncoder { input in
        .success([.one])
    }
}
