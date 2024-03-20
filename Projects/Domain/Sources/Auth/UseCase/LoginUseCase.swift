import RxSwift

public struct LoginUseCase {
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    private let authRepository: AuthRepository

    public func execute(req: LoginRequestQuery) -> Completable {
        return authRepository.login(req: req)
    }
}
