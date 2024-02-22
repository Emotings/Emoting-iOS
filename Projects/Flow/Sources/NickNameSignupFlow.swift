import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class NickNameSignupFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: NickNameSignupViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(NickNameSignupViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? NickNameSignupStep else { return .none }

        switch step {
        case .ageSignupIsRequired:
            return navigationToAgeSignup()
        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: PasswordSignupStep.oauthLoginIsRequired)
        case .nickNameSignupIsRequired:
            return navigationToNickNameSignup()
        }
    }
}

private extension NickNameSignupFlow {
    func navigationToNickNameSignup() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }

    func navigationToAgeSignup() -> FlowContributors {
        let ageSignupFlow = AgeSignupFlow(container: container)

        Flows.use(ageSignupFlow, when: .created) { (root) in
            self.rootViewController.navigationController?.pushViewController(
                root,
                animated: true
            )
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: ageSignupFlow,
            withNextStepper: OneStepper(withSingleStep: AgeSignupStep.ageSignupIsRequired)
        ))
    }
}
