import Foundation
import Swinject
import Core
import Domain

public final class PresentationAssembly: Assembly {
    public init() {}

    // swiftlint: disable function_body_length
    public func assemble(container: Container) {
        container.register(OnboardingReactor.self) { _ in
            OnboardingReactor()
        }
        container.register(OnboardingViewController.self) { resolver in
            OnboardingViewController(resolver.resolve(OnboardingReactor.self)!)
        }

        container.register(OauthLoginReactor.self) { _ in
            OauthLoginReactor()
        }
        container.register(OauthLoginViewController.self) { resolver in
            OauthLoginViewController(resolver.resolve(OauthLoginReactor.self)!)
        }

        container.register(EmailLoginReactor.self) { _ in
            EmailLoginReactor()
        }
        container.register(EmailLoginViewController.self) { resolver in
            EmailLoginViewController(resolver.resolve(EmailLoginReactor.self)!)
        }

        container.register(EmailSignupReactor.self) { _ in
            EmailSignupReactor()
        }
        container.register(EmailSignupViewController.self) { resolver in
            EmailSignupViewController(resolver.resolve(EmailSignupReactor.self)!)
        }

        container.register(PasswordSignupReactor.self) { _ in
            PasswordSignupReactor()
        }
        container.register(PasswordSignupViewController.self) { resolver in
            PasswordSignupViewController(resolver.resolve(PasswordSignupReactor.self)!)
        }

        container.register(NickNameSignupReactor.self) { _ in
            NickNameSignupReactor()
        }
        container.register(NickNameSignupViewController.self) { resolver in
            NickNameSignupViewController(resolver.resolve(NickNameSignupReactor.self)!)
        }

        container.register(AgeSignupReactor.self) { _ in
            AgeSignupReactor()
        }
        container.register(AgeSignupViewController.self) { resolver in
            AgeSignupViewController(resolver.resolve(AgeSignupReactor.self)!)
        }

        container.register(ProfilSignupReactor.self) { _ in
            ProfilSignupReactor()
        }
        container.register(ProfilSignupViewController.self) { resolver in
            ProfilSignupViewController(resolver.resolve(ProfilSignupReactor.self)!)
        }

        container.register(ChatReactor.self) { _ in
            ChatReactor()
        }
        container.register(ChatViewController.self) { resolver in
            ChatViewController(resolver.resolve(ChatReactor.self)!)
        }

        container.register(FriendsReactor.self) { _ in
            FriendsReactor()
        }
        container.register(FriendsViewController.self) { resolver in
            FriendsViewController(resolver.resolve(FriendsReactor.self)!)
        }

        container.register(StoreReactor.self) { _ in
            StoreReactor()
        }
        container.register(StoreViewController.self) { resolver in
            StoreViewController(resolver.resolve(StoreReactor.self)!)
        }

        container.register(MyPageReactor.self) { _ in
            MyPageReactor()
        }
        container.register(MyPageViewController.self) { resolver in
            MyPageViewController(resolver.resolve(MyPageReactor.self)!)
        }
        // swiftlint: enable function_body_length
    }
}
