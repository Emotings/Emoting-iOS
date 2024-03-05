import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class FriendsFlow: Flow {

    public let container: Container
    private let rootViewController = BaseNavigationController()

    public var root: Presentable {
        return rootViewController
    }

    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? FriendsStep else { return .none }
        switch step {
        case .friendsIsRequired:
            return presentFriends()
        }
    }
}

extension FriendsFlow {
    private func presentFriends() -> FlowContributors {
        let friendsViewController = container.resolve(FriendsViewController.self)!
        self.rootViewController.pushViewController(friendsViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: friendsViewController,
            withNextStepper: friendsViewController.reactor
        ))
    }

}
