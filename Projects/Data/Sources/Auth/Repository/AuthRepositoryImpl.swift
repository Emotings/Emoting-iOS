import RxSwift
import Domain

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    init(remoteAuthDataSource: any RemoteAuthDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    func login(req: Domain.LoginRequestQuery) -> RxSwift.Completable {
        remoteAuthDataSource.login(req: req)
            .asCompletable()
    }

    func signup(req: Domain.SignupRequestQuery) -> RxSwift.Completable {
        remoteAuthDataSource.signup(req: req)
    }
}
