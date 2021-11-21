@_exported import List
@_exported import Functions
@_exported import Currying

public struct BinaryEncoder<Element> {
    public typealias Input = Element
    public typealias Output = Result<List<Bit>, BinaryEncoderFailure>

    public let encode: (Input) -> Output
    
    public init(@BinaryEncoderBuilder encode: @escaping (Input) -> Output) {
        self.encode = encode
    }

    public func callAsFunction(_ input: Input) -> Output {
        encode(input)
    }
}
