import Foundation
import Functional

extension BinaryEncoder {
    public func map<T>(_ transform: @escaping (Element) -> T) -> BinaryEncoder<T> {
        BinaryEncoder<T>((transform(encode.0), encode.1))
    }
}

public func <^><A, B>(transform: @escaping (A) -> B, a: BinaryEncoder<A>) -> BinaryEncoder<B> {
    a.map(transform)
}

public func <&><A, B>(a: BinaryEncoder<A>, transform: @escaping (A) -> B) -> BinaryEncoder<B> {
    a.map(transform)
}
