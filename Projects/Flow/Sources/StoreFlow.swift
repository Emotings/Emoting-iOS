import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class StoreFlow: Flow {

    public let container: Container
    private let rootViewController = BaseNavigationController()

    public var root: Presentable {
        return rootViewController
    }

    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? StoreStep else { return .none }
        switch step {
        case .storeIsRequired:
            return presentStore()
        }
    }
}

extension StoreFlow {
    private func presentStore() -> FlowContributors {
        let storeViewController = container.resolve(StoreViewController.self)!
        self.rootViewController.pushViewController(storeViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: storeViewController,
            withNextStepper: storeViewController.reactor
        ))
    }
}
