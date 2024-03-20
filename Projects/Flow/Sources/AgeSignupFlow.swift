import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class AgeSignupFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: AgeSignupViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(AgeSignupViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AgeSignupStep else { return .none }

        switch step {
        case .ageSignupIsRequired:
            return navigationToAgeSignup()
        case .proFilSignupIsRequired:
            return navigationToProFilSignup()
        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: NickNameSignupStep.oauthLoginIsRequired)
        }
    }
}

private extension AgeSignupFlow {
    func navigationToAgeSignup() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }

    func navigationToProFilSignup() -> FlowContributors {
        let profilSignupFlow = ProFilSignupFlow(container: container)

        Flows.use(profilSignupFlow, when: .created) { (root) in
            self.rootViewController.navigationController?.pushViewController(
                root,
                animated: true
            )
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: profilSignupFlow,
            withNextStepper: OneStepper(withSingleStep: ProfilSignupStep.profilSignupIsRequired)
        ))
    }
}
