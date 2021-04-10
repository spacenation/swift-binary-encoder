import XCTest
@testable import BinaryEncoder
import Functional
import Binary

final class EncoderTests: XCTestCase {
    func testUInt8Encoder() {
        switch uInt8(3) {
        case .success(let bits):
            XCTAssertEqual(bits, [.zero, .zero, .zero, .zero, .zero, .zero, .one, .one])
        default:
            XCTFail()
        }
    }
    
    func testBinaryEncodable() {
        struct Some: BinaryEncodable {
            let this: UInt8
            let that: UInt8
            
            static var binaryEncoder: BinaryEncoder<Some> {
                BinaryEncoder { input in
                    uInt8(input.this) <> uInt8(input.that)
                }
            }
        }
        
        XCTAssertEqual(try? Some(this: 8, that: 9).encodedData(), Data([8, 9]))
    }
}
