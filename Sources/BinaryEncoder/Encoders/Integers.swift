import Foundation

public var uInt8: BinaryEncoder<UInt8> {
    BinaryEncoder { input in
        Result<List<Bit>, BinaryEncoderFailure>.success(input.bitsList)
    }
}

public var uInt16: BinaryEncoder<UInt16> {
    BinaryEncoder { input in
        Result<List<Bit>, BinaryEncoderFailure>.success(input.bytesList.flatMap { $0.bitsList })
    }
}

public var uInt32: BinaryEncoder<UInt32> {
    BinaryEncoder { input in
        Result<List<Bit>, BinaryEncoderFailure>.success(input.bytesList.flatMap { $0.bitsList })
    }
}

public var uInt64: BinaryEncoder<UInt64> {
    BinaryEncoder { input in
        Result<List<Bit>, BinaryEncoderFailure>.success(input.bytesList.flatMap { $0.bitsList })
    }
}
