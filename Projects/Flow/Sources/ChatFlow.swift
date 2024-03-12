import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation

public final class ChatFlow: Flow {

    public let container: Container
    private let rootViewController = BaseNavigationController()

    public var root: Presentable {
        return rootViewController
    }

    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? ChatStep else { return .none }
        switch step {
        case .chatIsRequired:
            return navigateToChat()
        case .chatRoomIsRequired:
            return navigateToChatRoom()
        }
    }
}

extension ChatFlow {
    private func navigateToChat() -> FlowContributors {
        let chatViewController = container.resolve(ChatViewController.self)!
        self.rootViewController.pushViewController(chatViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: chatViewController,
            withNextStepper: chatViewController.reactor
        ))
    }
    private func navigateToChatRoom() -> FlowContributors {
        let chatRoomViewController = container.resolve(ChatRoomViewController.self)!
        self.rootViewController.pushViewController(chatRoomViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: chatRoomViewController,
            withNextStepper: chatRoomViewController.reactor
        ))
    }
}
