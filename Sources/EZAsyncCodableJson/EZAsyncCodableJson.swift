import Alamofire
import AnyCodable
import Foundation
import ZippyJSON

public extension DataRequest {
    @discardableResult
    func asyncDecodable<T: Decodable>(of type: T.Type = T.self,
                                      queue: DispatchQueue = .main,
                                      dataPreprocessor: DataPreprocessor = DecodableResponseSerializer<T>.defaultDataPreprocessor,
                                      decoder: DataDecoder = ZippyJSONDecoder(),
                                      emptyResponseCodes: Set<Int> = DecodableResponseSerializer<T>.defaultEmptyResponseCodes,
                                      emptyRequestMethods: Set<HTTPMethod> = DecodableResponseSerializer<T>.defaultEmptyRequestMethods) async throws -> T {

        return try await withCheckedThrowingContinuation({ continuation in

            self.responseDecodable(of: type, queue: queue, dataPreprocessor: dataPreprocessor, decoder: decoder, emptyResponseCodes: emptyResponseCodes, emptyRequestMethods: emptyRequestMethods) { response in

                switch response.result {
                case .success(let decodedResponse):
                    continuation.resume(returning: decodedResponse)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
}

extension ZippyJSONDecoder: DataDecoder {}
