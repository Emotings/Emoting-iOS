import Foundation

public struct SignupRequestQuery: Encodable {
    public let email: String
    public let password: String
    public let nickname: String
    public let age: Int

    public init(email: String, password: String, nickname: String, age: Int) {
        self.email = email
        self.password = password
        self.nickname = nickname
        self.age = age
    }
}
