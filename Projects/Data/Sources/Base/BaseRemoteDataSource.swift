import Moya
import Domain
import AppNetwork
import Foundation
import RxSwift
import RxMoya
import Core
import Alamofire

class RemoteBaseDataSource<API: EmotingAPI> {
    private let keychain: any Keychain

    private let provider: MoyaProvider<API>

    init(keychain: any Keychain) {
        self.keychain = keychain
#if DEBUG
        self.provider = MoyaProvider<API>(plugins: [JwtPlugin(keychain: keychain), MoyaLogginPlugin()])
#else
        self.provider = MoyaProvider<API>(plugins: [JwtPlugin(keychain: keychain)])
#endif
    }

    func request(_ api: API) -> Single<Response> {
        return .create { single in
            var disposables: [Disposable] = []
            disposables.append(
                self.defaultRequest(api)
                    .subscribe(
                        onSuccess: { single(.success($0)) },
                        onFailure: { single(.failure($0)) }
                    )
            )
            return Disposables.create(disposables)
        }
    }
}

private extension RemoteBaseDataSource {
    func defaultRequest(_ api: API) -> Single<Response> {
        return provider.rx
            .request(api)
            .timeout(.seconds(120), scheduler: MainScheduler.asyncInstance)
            .catch { error in
                guard let code = (error as? MoyaError)?.response?.statusCode else {
                    return .error(error)
                }
                return .error(api.errorMap?[code] ?? error)
            }
    }
}
