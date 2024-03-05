import UIKit
import RxFlow
import RxSwift
import Core
import Swinject
import Presentation
import DesignSystem

public final class TabsFlow: Flow {

    public let container: Container
    private let tabBarController = BaseTabBarController()

    public var root: Presentable {
        return self.tabBarController
    }
    init(container: Container) {
        self.container = container
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .tabIsRequired:
            return navigateToTabs()
        default:
            return .none
        }
    }
    // swiftlint: disable function_body_length
    private func navigateToTabs() -> FlowContributors {
        let chatFlow = ChatFlow(container: container)
        let friendsFlow = FriendsFlow(container: container)
        let storeFlow = StoreFlow(container: container)
        let myPageFlow = MyPageFlow(container: container)

        Flows.use(
            chatFlow,
            friendsFlow,
            storeFlow,
            myPageFlow,
            when: .created
        ) { [weak self] chat, friends, store, mypage in

            let tabItem1 = UITabBarItem(
                title: nil,
                image: UIImage.emotingImage(.chat),
                selectedImage: UIImage.emotingImage(.chat).withTintColor(
                    .Main.main500,
                    renderingMode: .alwaysOriginal
                )
            )
            let tabItem2 = UITabBarItem(
                title: nil,
                image: UIImage.emotingImage(.humanPlus),
                selectedImage: UIImage.emotingImage(.humanPlus).withTintColor(
                    .Main.main500,
                    renderingMode: .alwaysOriginal
                )
            )
            let tabItem3 = UITabBarItem(
                title: nil,
                image: UIImage.emotingImage(.store),
                selectedImage: UIImage.emotingImage(.store).withTintColor(
                    .Main.main500,
                    renderingMode: .alwaysOriginal
                )
            )
            let tabItem4 = UITabBarItem(
                title: nil,
                image: UIImage.emotingImage(.userProfile),
                selectedImage: UIImage.emotingImage(.userProfile).withTintColor(
                    .Main.main500,
                    renderingMode: .alwaysOriginal
                )
            )
            chat.tabBarItem = tabItem1
            friends.tabBarItem = tabItem2
            store.tabBarItem = tabItem3
            mypage.tabBarItem = tabItem4

            self?.tabBarController.setViewControllers(
                [
                    chat,
                    friends,
                    store,
                    mypage
                ], animated: false)
        }
        return .multiple(flowContributors: [
            .contribute(
                withNextPresentable: chatFlow,
                withNextStepper: OneStepper(withSingleStep: ChatStep.chatIsRequired)
            ),
            .contribute(
                withNextPresentable: friendsFlow,
                withNextStepper: OneStepper(withSingleStep: FriendsStep.friendsIsRequired)
            ),
            .contribute(
                withNextPresentable: storeFlow,
                withNextStepper: OneStepper(withSingleStep: StoreStep.storeIsRequired)
            ),
            .contribute(
                withNextPresentable: myPageFlow,
                withNextStepper: OneStepper(withSingleStep: MyPageStep.myPageIsRequired)
            )
        ])
    }
    // swiftlint: enable function_body_length
}
