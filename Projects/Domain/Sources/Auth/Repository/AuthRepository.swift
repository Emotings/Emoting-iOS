import RxSwift

public protocol AuthRepository {
    func login(req: LoginRequestQuery) -> Completable
    func signup(req: SignupRequestQuery) -> Completable
}
