import Foundation
import Swinject
import Core
import Domain

public final class DataSourceAssembly: Assembly {
    public init() {}

    private let keychain = { (resolver: Resolver) in
        resolver.resolve(Keychain.self)!
    }

    public func assemble(container: Container) {
        container.register(RemoteAuthDataSource.self) { resolver in
            RemoteAuthDataSourceImpl(keychain: self.keychain(resolver))
        }
    }
}
