import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class NickNameSignupReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case nextButtonDidTap
    }

    public enum Mutation {
        case navigateToAgeSignup
    }

    public struct State { }
}

extension NickNameSignupReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .nextButtonDidTap:
            return .just(.navigateToAgeSignup)
        }
    }

    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToAgeSignup:
            steps.accept(NickNameSignupStep.ageSignupIsRequired)
        }
        return newState
    }
}
