import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class ProFilSignupFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: ProfilSignupViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(ProfilSignupViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? ProfilSignupStep else { return .none }

        switch step {
        case .profilSignupIsRequired:
            return navigationToProfilSignup()

        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: AgeSignupStep.oauthLoginIsRequired)
        }
    }
}

private extension ProFilSignupFlow {
    func navigationToProfilSignup() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }
}
