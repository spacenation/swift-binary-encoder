import XCTest
@testable import BinaryEncoder
import Functional
import Binary

final class EncoderTests: XCTestCase {
    func testEncoder() {
        
//        enum EncoderError: Error {
//            case undefined
//        }
//        
        func number(_ n: Int) -> BinaryEncoder<Int> {
            BinaryEncoder((n, List.list(.one, .list(.zero, .empty))))
        }
//        
        let one = BinaryEncoder((Bit.one, List.list(.one, .empty)))
//        
//        let zero = BinaryEncoder(Bit.zero, List.list(.zero, .empty))
//        
//        let other = BinaryEncoder(8, List.list(.zero, .empty))
//    
//        let encoder: BinaryEncoder<List<Bit>> =
//            List<Bit>.pure(.empty) >>- one
//
                //print(encoder.encode.1)
        ///XCTAssertEqual(encoder.accumulator, List.list(.one, .list(.zero, .empty)))
    }

    static var allTests = [
        ("testEncoder", testEncoder),
    ]
}
