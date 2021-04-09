import Foundation
@_exported import Functional
@_exported import Binary

//public struct BinaryEncoder<Input, Element, Failure: Error> {
//    public typealias Output = Result<(element: Element, next: Input), Failure>
//    
//    public let encode: (Input) -> Output
//    
//    public init(encode: @escaping (Input) -> Output) {
//        self.encode = encode
//    }
//    
//    func callAsFunction(_ input: (Input)) -> Output {
//        encode(input)
//    }
//}

public struct BinaryEncoder<Element> {
    let encode: (Element, List<Bit>)
    
    public init(_ encode: (Element, List<Bit>)) {
        self.encode = encode
    }
}
