import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class TestFlow: Flow {

    public let container: Container
    private let rootViewController = BaseNavigationController()

    public var root: Presentable {
        return rootViewController
    }

    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .testIsRequired:
            return navigateToTest()
        default:
            return .none
        }
    }

    private func navigateToTest() -> FlowContributors {
        let testViewController = container.resolve(ChatRoomViewController.self)!

        self.rootViewController.pushViewController(testViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: testViewController,
            withNextStepper: testViewController.reactor
        ))
    }
}
