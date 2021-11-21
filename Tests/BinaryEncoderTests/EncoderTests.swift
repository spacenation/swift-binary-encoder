import XCTest
@testable import BinaryEncoder

final class EncoderTests: XCTestCase {
    func testBinaryEncodable2() {
        struct Some {
            let this: UInt8
            let that: UInt8
        }
        
        let encoder = BinaryEncoder<Some> { input in
            uInt8(input.this) +
            uInt8(input.that)
        }
        
        let result = encoder(Some(this: 8, that: 9))
        
        XCTAssertEqual(try? result.data(), Data([8, 9]))
    }
    
    func testBinaryEncodable() {
        struct Some: BinaryEncodable {
            let this: UInt8
            let that: UInt8
            
            static var binaryEncoder: BinaryEncoder<Some> {
                BinaryEncoder { input in
                    uInt8(input.this) +
                    uInt8(input.that)
                }
            }
        }
        
        XCTAssertEqual(try? Some(this: 8, that: 9).binaryEncoded.data(), Data([8, 9]))
    }
}
