import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class AppFlow: Flow {
    public let window: UIWindow
    public let container: Container
    public var root: Presentable {
        return self.window
    }

    public init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .onboardingIsRequired:
            return navigationToOnboarding()
        case .oauthLoginIsRequired:
            return navigationToOauthLogin()
        case .tabIsRequired:
            return navigationToTab()
        }
    }
}

private extension AppFlow {
    func navigationToOnboarding() -> FlowContributors {
        let onboardingFlow = OnboardingFlow(container: container)

        Flows.use(onboardingFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: onboardingFlow,
            withNextStepper: OneStepper(withSingleStep: OnboardingStep.onboardingIsRequired)
        ))
    }

    func navigationToOauthLogin() -> FlowContributors {
        let oauthLoginFlow = OauthLoginFlow(container: container)

        Flows.use(oauthLoginFlow, when: .created) { (root) in
            UIView.transition(
                with: self.window,
                duration: 0.5,
                options: .transitionCrossDissolve
            ) {
                self.window.rootViewController = root
            }
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: oauthLoginFlow,
            withNextStepper: OneStepper(withSingleStep: OauthLoginStep.oauthLoginIsRequired)
        ))
    }

    func navigationToTab() -> FlowContributors {
        let tabsFlow = TabsFlow(container: container)
        Flows.use(
            tabsFlow,
            when: .created
        ) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: tabsFlow,
            withNextStepper: OneStepper(withSingleStep: AppStep.tabIsRequired)
            )
        )
    }
}
