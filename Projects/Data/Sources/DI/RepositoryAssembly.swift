import Foundation
import Swinject
import Domain

public final class RepositoryAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.register(AuthRepository.self) { resolver in
            AuthRepositoryImpl(remoteAuthDataSource: resolver.resolve(RemoteAuthDataSource.self)!)
        }
    }
}