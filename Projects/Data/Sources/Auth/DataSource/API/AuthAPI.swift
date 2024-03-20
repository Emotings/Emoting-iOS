import Moya
import Domain
import AppNetwork

enum AuthAPI {
    case login(LoginRequestQuery)
    case signup(SignupRequestQuery)
}

extension AuthAPI: EmotingAPI {
    typealias ErrorType = Error

    var domain: EmotingDomain {
        .auth
    }

    var urlPath: String {
        switch self {
        case .login:
            return "/login"
        case .signup:
            return "/signup"
        }
    }

    var method: Method {
        return .post
    }

    var task: Task {
        switch self {
        case let .login(req):
            return .requestJSONEncodable(req)

        case let .signup(req):
            return .requestJSONEncodable(req)
        }
    }

    var jwtTokenType: JwtTokenType {
        return .none
    }

    var errorMap: [Int: ErrorType]? {
        return nil
    }
}
