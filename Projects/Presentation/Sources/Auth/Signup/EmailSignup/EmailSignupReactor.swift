import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class EmailSignupReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case nextButtonDidTap
    }

    public enum Mutation {
        case navigateToPasswordSignup
    }

    public struct State { }
}

extension EmailSignupReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .nextButtonDidTap:
            return .just(.navigateToPasswordSignup)
        }
    }

    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToPasswordSignup:
            steps.accept(EmailSignupStep.passwordSignupIsrequired)
        }
        return newState
    }
}
