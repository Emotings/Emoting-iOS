import Foundation
import Swinject
import Domain

public final class UseCaseAssembly: Assembly {
    public init() {}

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
}
