import RxSwift
import Domain
import AppNetwork

protocol RemoteAuthDataSource {
    func login(req: LoginRequestQuery) -> Single<TokenDTO>
    func signup(req: SignupRequestQuery) -> Completable
}

final class RemoteAuthDataSourceImpl: RemoteBaseDataSource<AuthAPI>, RemoteAuthDataSource {
    func login(req: LoginRequestQuery) -> Single<TokenDTO> {
        return request(.login(req))
            .map(TokenDTO.self)
    }

    func signup(req: SignupRequestQuery) -> Completable {
        return request(.signup(req))
            .asCompletable()
    }

}
