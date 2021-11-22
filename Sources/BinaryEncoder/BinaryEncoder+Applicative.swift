import Foundation

extension BinaryEncoder {

}

public func pure<A>(_ a: List<Bit>) -> BinaryEncoder<A> {
    BinaryEncoder<A> { _ in .success(a) }
}
