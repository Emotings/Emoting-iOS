import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class AgeSignupReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case nextButtonDidTap
    }

    public enum Mutation {
        case navigateToProfilSignup
    }

    public struct State { }
}

extension AgeSignupReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .nextButtonDidTap:
            return .just(.navigateToProfilSignup)
        }
    }

    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToProfilSignup:
            steps.accept(AgeSignupStep.proFilSignupIsRequired)
        }
        return newState
    }
}
