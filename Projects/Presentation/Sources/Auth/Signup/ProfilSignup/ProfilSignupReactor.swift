import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class ProfilSignupReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case nextButtonDidTap
    }

    public enum Mutation {
        case signupSuccess
    }

    public struct State { }
}

extension ProfilSignupReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .nextButtonDidTap:
            return .just(.signupSuccess)
        }
    }

    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .signupSuccess:
            steps.accept(ProFilSignupStep.oauthLoginIsRequired)
        }
        return newState
    }
}
