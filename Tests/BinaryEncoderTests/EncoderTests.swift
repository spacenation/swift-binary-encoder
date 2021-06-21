import XCTest
@testable import BinaryEncoder

final class EncoderTests: XCTestCase {
    func testBinaryEncodable2() {
        struct Some {
            let this: UInt8
            let that: UInt8
        }
        
        let encoder = Encoder<Some, Bit> { input in
            input.this
            input.that
        }
        
        let result = encoder(Some(this: 8, that: 9))
        
        XCTAssertEqual(try? result.data(), Data([8, 9]))
    }
    
    func testBinaryEncodable() {
        struct Some: BinaryEncodable {
            let this: UInt8
            let that: UInt8
            
            static let binaryEncoder = BinaryEncoder<Some> { input in
                Repeat(2) {
                    input.this
                    Repeat(1) {
                        Section {
                            input.that
                        }
                        
                        Section {
                            
                        }
                    }

                }
            }
        }
        
        XCTAssertEqual(try? Some(this: 8, that: 9).binaryEncoded.data(), Data([8, 9, 8, 9]))
    }
}
