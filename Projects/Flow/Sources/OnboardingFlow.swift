import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class OnboardingFlow: Flow {
    public let container: Container
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController: OnboardingViewController

    public init(container: Container) {
        self.container = container
        self.rootViewController = container.resolve(OnboardingViewController.self)!
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? OnboardingStep else { return .none }

        switch step {
        case .onboardingIsRequired:
            return navigationToOnboarding()

        case .oauthLoginIsRequired:
            return .end(forwardToParentFlowWithStep: AppStep.oauthLoginIsRequired)

        case .tabIsRequired:
            return .end(forwardToParentFlowWithStep: AppStep.tabIsRequired)
        }
    }
}

private extension OnboardingFlow {
    func navigationToOnboarding() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.reactor
        ))
    }
}
