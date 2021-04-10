import Foundation
import Binary

public protocol BinaryEncodable {
    static var binaryEncoder: BinaryEncoder<Self> { get }
}

public extension BinaryEncodable {
    func encodedData() throws -> Data {
        switch Self.binaryEncoder(self) {
        case .success(let result):
            return Data(result.bytes)
        case .failure(let error):
            throw error
        }
    }
    
    var encodedBinary: Result<List<Bit>, EncodingError> {
        Self.binaryEncoder(self)
    }
}

public extension List where Element == Bit {
    var bytes: [UInt8] {
        let numBits = self.count
        let numBytes = (numBits + 7)/8
        var bytes = Array<UInt8>(repeating: 0, count: numBytes)
        
        for (index, bit) in self.enumerated() {
            if bit == .one {
                bytes[index / 8] += 1 << (7 - index % 8)
            }
        }
        return bytes
    }
}

public extension UInt8 {
    var bitsList: List<Bit> {
        List((0...7)).map { self.bit(at: 7 - $0) }
    }
}

public extension UInt16 {
    var bytesList: List<UInt8> {
        [UInt8(self & 0xff), UInt8(self >> 8)]
    }
}

public extension UInt32 {
    var bytesList: List<UInt8> {
        [UInt8(self & 0x000000FF), UInt8((self & 0x0000FF00) >> 8), UInt8((self & 0x00FF0000) >> 16), UInt8((self & 0xFF000000) >> 24)]
    }
}

public extension UInt64 {
    var bytesList: List<UInt8> {
        [
            UInt8(self & 0x00000000000000FF),
            UInt8((self & 0x000000000000FF00) >> 8),
            UInt8((self & 0x0000000000FF0000) >> 16),
            UInt8((self & 0x00000000FF000000) >> 24),
            UInt8((self & 0x000000FF00000000) >> 32),
            UInt8((self & 0x0000FF0000000000) >> 40),
            UInt8((self & 0x00FF000000000000) >> 48),
            UInt8((self & 0xFF00000000000000) >> 56),
        ]
    }
}

