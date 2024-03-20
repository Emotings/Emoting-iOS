import RxSwift

public struct SignupUseCase {
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    private let authRepository: AuthRepository

    public func execute(req: SignupRequestQuery) -> Completable {
        return authRepository.signup(req: req)
    }
}
