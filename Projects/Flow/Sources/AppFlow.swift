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

    private let rootViewController: MainViewController

    public init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        self.rootViewController = MainViewController(MainReactor())
    }

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .onboardingIsRequired:
            return navigationToOnboarding()
        }
    }
}

private extension AppFlow {
    func navigationToOnboarding() -> FlowContributors {
        self.window.rootViewController = rootViewController
        return .one(
            flowContributor: .contribute(
                withNextPresentable: rootViewController,
                withNextStepper: rootViewController.reactor
            )
        )
    }
}
