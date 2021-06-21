import Foundation

public extension EncoderBuilder {
    typealias BinaryComponent = Result<List<Bit>, EncodingError>
    
    static func buildBlock() -> BinaryComponent {
        .success(.empty)
    }
    
    static func buildExpression(_ expression: UInt8) -> BinaryComponent {
        .success(expression.bitsList)
    }
    
    static func buildExpression(_ expression: UInt16) -> BinaryComponent {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    static func buildExpression(_ expression: UInt32) -> BinaryComponent {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    static func buildExpression(_ expression: UInt64) -> BinaryComponent {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    static func buildExpression(_ expression: Bool) -> BinaryComponent {
        switch expression {
        case true:
            return .success([.one])
        default:
            return .success([.zero])
        }
    }
    
    static func buildExpression(_ expression: Bit) -> BinaryComponent {
        .success(List.init(head: expression))
    }
    
    static func buildExpression(_ expression: List<Bit>) -> BinaryComponent {
        .success(expression)
    }
    
    static func buildExpression<T: Encodable>(_ expression: T) -> Result<List<T.Primitive>, T.Failure> where T.Primitive == Bit, T.Failure == EncodingError {
        expression.encoded
    }
    
    static func buildExpression<T: BinaryEncodable>(_ expression: T) -> BinaryComponent {
        expression.binaryEncoded
    }
}
