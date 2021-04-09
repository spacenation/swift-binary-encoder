import Foundation
import Functional

extension BinaryEncoder {
    public func flatMap<NewElement>(_ transform: @escaping (Element) -> BinaryEncoder<NewElement>) -> BinaryEncoder<NewElement> {
        let newEncoder = transform(encode.0)
        return BinaryEncoder<NewElement>((newEncoder.encode.0, encode.1.append(newEncoder.encode.1)))
    }
}

public func >>-<A, NewElement>(transform: @escaping (A) -> BinaryEncoder<NewElement>, a: BinaryEncoder<A>) -> BinaryEncoder<NewElement> {
    a.flatMap(transform)
}
