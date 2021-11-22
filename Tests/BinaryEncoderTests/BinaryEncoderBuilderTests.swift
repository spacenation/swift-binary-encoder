import XCTest
import BinaryEncoder

final class BinaryEncoderBuilderTests: XCTestCase {
    
    func testBinaryEncoderBuilder() {
        struct Message: BinaryEncodable {
            
            let attempt: UInt8
            let lenght: UInt8
            let requiresResponse: Bool
            
            static let binaryEncoder = BinaryEncoder<Self> { input in
                uInt8(input.attempt)
                uInt8(input.lenght)
                input.requiresResponse
                true
                
                BinaryEncoder {
                    false
                    true
                    true
                }
                .count(2)
            }
        }
        
        let message = Message(
            attempt: 1,
            lenght: 254,
            requiresResponse: true
        )
        
        switch message.binaryEncoded {
        case .success(let bits):
            XCTAssertEqual(
                bits,
                [
                    /// UInt8, 8
                    .zero, .zero, .zero, .zero, .zero, .zero, .zero, .one,
                    /// UInt8, 9
                    .one, .one, .one, .one, .one, .one, .one, .zero,
                    /// Bool, true
                    .one,
                    /// Encode static bool
                    .one,
                    /// Void Encoder (Twice)
                    .zero, .one, .one, .zero, .one, .one
                ]
            )
        case .failure:
            XCTFail()
        }
    }
}
