import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class EmailLoginFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    public let rootViewController: EmailLoginViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(EmailLoginViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? EmailLoginStep else { return .none }

        switch step {
        case .emailLoginisRequired:
            return navigationToEmailLogin()
        case .tabIsRequired:
            return .end(forwardToParentFlowWithStep: OauthLoginStep.tabIsRequired)
        }
    }
}

private extension EmailLoginFlow {
    func navigationToEmailLogin() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }
}
