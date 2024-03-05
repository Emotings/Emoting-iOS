import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class MyPageFlow: Flow {

    public let container: Container
    private let rootViewController = BaseNavigationController()

    public var root: Presentable {
        return rootViewController
    }

    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? MyPageStep else { return .none }
        switch step {
        case .myPageIsRequired:
            return presentMyPage()
        }
    }
}

extension MyPageFlow {
    private func presentMyPage() -> FlowContributors {
        let myPageViewController = container.resolve(MyPageViewController.self)!
        self.rootViewController.pushViewController(myPageViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: myPageViewController.reactor
        ))
    }
}
