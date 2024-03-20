import Foundation
import Swinject
import Domain

public final class UseCaseAssembly: Assembly {
    public init() {}

// swiftlint:disable function_body_length
    public func assemble(container: Container) {
        // Auth
        container.register(LoginUseCase.self) { resolver in
            LoginUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
        container.register(SignupUseCase.self) { resolver in
            SignupUseCase(
                authRepository: resolver.resolve(AuthRepository.self)!
            )
        }
    }
    // swiftlint:enable function_body_length
}
