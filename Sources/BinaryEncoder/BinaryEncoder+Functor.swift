import Foundation
import Binary

extension BinaryEncoder {
    public func map(_ transform: @escaping (List<Bit>) -> List<Bit>) -> BinaryEncoder<Element> {
        BinaryEncoder { input in
            switch self.encode(input) {
            case .success(let list):
                return .success(transform(list))
            case .failure(let failure):
                return .failure(failure)
            }
        }
    }
}
