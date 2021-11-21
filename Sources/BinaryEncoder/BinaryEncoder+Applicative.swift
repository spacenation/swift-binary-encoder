import Foundation

extension BinaryEncoder {
    public static func pure(_ a: List<Bit>) -> Self {
        BinaryEncoder { _ in Result<List<Bit>, BinaryEncoderFailure>.success(a) }
    }
}
