import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class EmailSignupFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: EmailSignupViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(EmailSignupViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? EmailSignupStep else { return .none }

        switch step {
        case .emailSignupIsRequired:
            return navigationToEmailSignup()
        case .passwordSignupIsrequired:
            return navigationToPasswordSignup()
        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: OauthLoginStep.oauthLoginIsRequired)
        }
    }
}

private extension EmailSignupFlow {
    func navigationToEmailSignup() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }

    func navigationToPasswordSignup() -> FlowContributors {
        let passwordSignupFlow = PasswordSignupFlow(container: container)

        Flows.use(passwordSignupFlow, when: .created) { (root) in
            self.rootViewController.navigationController?.pushViewController(
                root,
                animated: true
            )
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: passwordSignupFlow,
            withNextStepper: OneStepper(withSingleStep: PasswordSignupStep.passwordSignupIsrequired)
        ))
    }
}
