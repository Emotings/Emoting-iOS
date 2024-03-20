import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class OauthLoginFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: BaseNavigationController

    public init(container: Container) {
        self.container = container
        self.rootViewController = BaseNavigationController()
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? OauthLoginStep else { return .none }

        switch step {
        case .oauthLoginIsRequired:
            return navigationToOauthLogin()
        case .emailLoginisRequired:
            return navigationToEmailLogin()
        case .emailSignupIsRequired:
            return navigationToEmailSignup()
        case .tabIsRequired:
            return .end(forwardToParentFlowWithStep: AppStep.tabIsRequired)
        }
    }
}

private extension OauthLoginFlow {
    func navigationToOauthLogin() -> FlowContributors {
        let oauthLoginViewController = container.resolve(OauthLoginViewController.self)!

        self.rootViewController.setViewControllers(
            [oauthLoginViewController],
            animated: true
        )

        return .one(flowContributor: .contribute(
            withNextPresentable: oauthLoginViewController,
            withNextStepper: oauthLoginViewController.reactor
        ))
    }

    func navigationToEmailLogin() -> FlowContributors {
        let emailLoginFlow = EmailLoginFlow(container: container)

        Flows.use(emailLoginFlow, when: .created) { (root) in
            self.rootViewController.pushViewController(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: emailLoginFlow,
            withNextStepper: OneStepper(withSingleStep: EmailLoginStep.emailLoginisRequired)
        ))
    }

    func navigationToEmailSignup() -> FlowContributors {
        let emailSignupFlow = EmailSignupFlow(container: container)

        Flows.use(emailSignupFlow, when: .created) { (root) in
            self.rootViewController.pushViewController(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: emailSignupFlow,
            withNextStepper: OneStepper(withSingleStep: EmailSignupStep.emailSignupIsRequired)
        ))
    }
}
