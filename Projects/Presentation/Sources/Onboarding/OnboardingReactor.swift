import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class OnboardingReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action {
        case viewDidAppear
    }

    public enum Mutation {
        case refreshSuccess
        case refreshFail
    }

    public struct State { }
}

extension OnboardingReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidAppear:
            return .just(.refreshFail)
                .delay(.seconds(1), scheduler: MainScheduler.asyncInstance)
        }
    }
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state

        switch mutation {
        case .refreshFail:
            steps.accept(OnboardingStep.oauthLoginIsRequired)

        case .refreshSuccess:
            steps.accept(OnboardingStep.tabIsRequired)
        }

        return newState
    }
}
