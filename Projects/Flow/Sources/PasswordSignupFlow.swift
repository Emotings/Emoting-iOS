import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class PasswordSignupFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: PasswordSignupViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(PasswordSignupViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PasswordSignupStep else { return .none }

        switch step {
        case .passwordSignupIsrequired:
            return navigationToPasswordSignup()
        case .nickNameSignupIsRequired:
            return navigationToNickNameSignup()
        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: EmailSignupStep.oauthLoginIsRequired)
        }
    }
}

private extension PasswordSignupFlow {
    func navigationToPasswordSignup() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }

    func navigationToNickNameSignup() -> FlowContributors {
        let nickNameSignupFlow = NickNameSignupFlow(container: container)
        Flows.use(nickNameSignupFlow, when: .created) { (root) in
            self.rootViewController.navigationController?.pushViewController(
                root,
                animated: true
            )
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: nickNameSignupFlow,
            withNextStepper: OneStepper(withSingleStep: NickNameSignupStep.nickNameSignupIsRequired)
        ))
    }
}
