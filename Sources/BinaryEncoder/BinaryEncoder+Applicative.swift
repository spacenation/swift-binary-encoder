import Foundation
import Functional

extension BinaryEncoder {
    public static func pure(_ a: Element) -> Self {
        BinaryEncoder((a, .mempty))
    }
    
    public func apply<T>(_ transform: BinaryEncoder<(Element) -> T>) -> BinaryEncoder<T> {
        BinaryEncoder<T>((transform.encode.0(encode.0), transform.encode.1.append(encode.1)))
    }
//
//    public func discard<A>(_ a: BinaryEncoder<A>) -> Self {
//        a.apply(self.map(constant))
//    }
//
//    public func discardThen<A>(_ a: BinaryEncoder<A>) -> BinaryEncoder<A> {
//        a.apply(self.map(constant(identity)))
//    }
}
////
public func <*><A, B>(left: BinaryEncoder<(A) -> B>, right: BinaryEncoder<A>) -> BinaryEncoder<B> {
    right.apply(left)
}
//
//public func <*<A, B>(left: BinaryEncoder<A>, right: BinaryEncoder<B>) -> BinaryEncoder<A> {
//    left.discard(right)
//}
//
//public func *><A, B>(left: BinaryEncoder<A>, right: BinaryEncoder<B>) -> BinaryEncoder<B> {
//    left.discardThen(right)
//}
