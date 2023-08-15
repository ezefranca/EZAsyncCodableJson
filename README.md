# EZAsyncCodableJson

Simple extension to use ZippyJSON + async + Alamofire

```swift
 public func getData() async throws -> ResponseCodable {

        // Fetch Request asynchronously
        let response = try await AF.request("some-service.com", method: .get, parameters: [:], headers: .default)
            .validate()
            .asyncDecodable(of: ResponseCodable.self)
        return response
    }

```

- ZippyJSON can be 3x+ faster then Apple Default.
  
