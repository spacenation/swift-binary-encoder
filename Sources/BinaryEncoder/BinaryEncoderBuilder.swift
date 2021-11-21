import Foundation

@resultBuilder public struct BinaryEncoderBuilder {
    typealias BinaryComponent = Result<List<Bit>, BinaryEncoderFailure>
    
    static func buildBlock() -> BinaryComponent {
        .success(.empty)
    }
    
//    static func buildBlock<D1, D2>(_ d1: BinaryDecoder<D1>, _ d2: BinaryDecoder<D2>) -> (BinaryDecoder<(D1, D2)>) {
//        BinaryDecoder {
//            d1($0).flatMap { first in
//                d2(first.next).flatMap { second in
//                    .success((element: (first.element, second.element), next: second.next))
//                }
//            }
//        }
//    }
    
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
    
    static func buildExpression<T: BinaryEncodable>(_ expression: T) -> BinaryComponent {
        expression.binaryEncoded
    }
    
    public static func buildEither<Primitive, Failure: Error>(first component: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure> {
        component
    }
    
    public static func buildEither<Primitive, Failure: Error>(second component: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure> {
        component
    }
    
    public static func buildExpression<Primitive, Failure: Error>(_ expression: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure> {
        expression
    }
    
    public static func buildBlock<Primitive, Failure: Error>(_ components: Result<List<Primitive>, Failure>...) -> Result<List<Primitive>, Failure> {
        components.reduce(.success(.empty), +)
    }
}

public func +<Failure, Primitive>(lhs: Result<List<Primitive>, Failure>, rhs: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure>  {
    switch (lhs, rhs) {
    case (.success(let s1), .success(let s2)):
        return .success(s1.append(s2))
    case (.failure(let e1), _):
        return .failure(e1)
    case (_ , .failure(let e2)):
        return .failure(e2)
    }
}
