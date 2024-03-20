import Foundation
import Moya

public protocol EmotingAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: EmotingDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType]? { get }
}

public extension EmotingAPI {
    var baseURL: URL {
        URL(
            string: "http://52.79.170.221:8080"
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum EmotingDomain: String {
    case auth
}

extension EmotingDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}

private class BundleFinder {}

extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
