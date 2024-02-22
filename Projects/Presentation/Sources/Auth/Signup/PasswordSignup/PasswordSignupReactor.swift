import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class PasswordSignupReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case nextButtonDidTap
    }

    public enum Mutation {
        case navigateToNickNameSignup
    }

    public struct State { }
}

extension PasswordSignupReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .nextButtonDidTap:
            return .just(.navigateToNickNameSignup)
        }
    }
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .navigateToNickNameSignup:
            steps.accept(PasswordSignupStep.nickNameSignupIsRequired)
        }
        return newState
    }
}
