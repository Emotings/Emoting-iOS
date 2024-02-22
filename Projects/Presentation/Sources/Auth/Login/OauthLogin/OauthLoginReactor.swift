import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class OauthLoginReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case emailLoginButtonDidTap
        case emailSignupButtonDidTap
    }

    public enum Mutation {
        case navigateToEmailLogin
        case navigateToEmailSignup
    }

    public struct State { }
}

extension OauthLoginReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .emailLoginButtonDidTap:
            return .just(.navigateToEmailLogin)
        case .emailSignupButtonDidTap:
            return .just(.navigateToEmailSignup)
        }
    }

    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToEmailLogin:
            steps.accept(OauthLoginStep.emailLoginisRequired)
        case .navigateToEmailSignup:
            steps.accept(OauthLoginStep.emailSignupIsRequired)
        }
        return newState
    }
}
