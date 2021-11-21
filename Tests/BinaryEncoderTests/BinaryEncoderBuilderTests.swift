import XCTest
import BinaryEncoder

final class BinaryEncoderBuilderTests: XCTestCase {
    func testBinaryEncoderBuilder() {
//        struct Message {
//            let attempt: UInt8
//            let lenght: UInt8
//            let requiresResponse: Bool
//        }
//        
//        let message = Message(
//            attempt: 1,
//            lenght: 254,
//            requiresResponse: true
//        )
//        
//        let messageEncoder = BinaryEncoder<Message> { input in
//            uInt8(input.attempt)
//            uInt8(input.lenght)
//            input.requiresResponse
//        }
//        
//        switch messageEncoder(message) {
//        case .success(let bits):
//            XCTAssertEqual(
//                bits,
//                [
//                    /// UInt8, 8
//                    .zero, .zero, .zero, .zero, .zero, .zero, .zero, .one,
//                    /// UInt8, 9
//                    .one, .one, .one, .one, .one, .one, .one, .zero
//                ]
//            )
//        case .failure:
//            XCTFail()
//        }
    }
}
