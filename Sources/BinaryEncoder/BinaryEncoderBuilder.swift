import Foundation

@resultBuilder public struct BinaryEncoderBuilder {
    public typealias Component = Result<List<Bit>, BinaryEncoderFailure>
    
    static func buildBlock() -> Component {
        .success(.empty)
    }
    
    public static func buildExpression(_ expression: UInt8) -> Component {
        .success(expression.bitsList)
    }
    
    public static func buildExpression(_ expression: UInt16) -> Component {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    public static func buildExpression(_ expression: UInt32) -> Component {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    public static func buildExpression(_ expression: UInt64) -> Component {
        .success(expression.bytesList.flatMap { $0.bitsList })
    }
    
    public static func buildExpression(_ expression: Bool) -> Component {
        switch expression {
        case true:
            return .success([.one])
        default:
            return .success([.zero])
        }
    }
    
    public static func buildExpression(_ expression: Bit) -> Component {
        .success(List.init(head: expression))
    }
    
    public static func buildExpression(_ expression: List<Bit>) -> Component {
        .success(expression)
    }
    
    public static func buildExpression(_ expression: BinaryEncoder<Void>) -> Component {
        expression()
    }
    
    public static func buildExpression<T: BinaryEncodable>(_ expression: T) -> Component {
        expression.binaryEncoded
    }
    
    public static func buildEither(first component: Component) -> Component {
        component
    }
    
    public static func buildEither(second component: Component) -> Component {
        component
    }
    
    public static func buildExpression(_ expression: Component) -> Component {
        expression
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        components.reduce(.success(.empty), +)
    }
}

private func +<Failure, Primitive>(lhs: Result<List<Primitive>, Failure>, rhs: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure> {
    lhs.flatMap { s1 in
        rhs.flatMap { s2 in
            .success(s1.append(s2))
        }
    }
}
