import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class EmailLoginReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public var initialState = State()
    private let disposeBag = DisposeBag()
    private let loginUseCase: LoginUseCase

    init(loginUseCase: LoginUseCase) {
        self.initialState = .init()
        self.loginUseCase = loginUseCase
    }

    public enum Action {
        case updateEmail(String)
        case updatePassword(String)
        case loginButtonDidTap
    }

    public enum Mutation {
        case updateEmail(String)
        case updatePassword(String)
        case loginSuccess
    }

    public struct State {
        var email: String = ""
        var passowrd: String = ""
    }
}

extension EmailLoginReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .updateEmail(email):
            return .just(.updateEmail(email))
        case let .updatePassword(password):
            return .just(.updatePassword(password))
        case .loginButtonDidTap:
            return loginButtonDidTap(
                email: self.currentState.email,
                password: self.currentState.passowrd
            )
        }
    }
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .updateEmail(email):
            newState.email = email
        case let .updatePassword(password):
            newState.passowrd = password
        case .loginSuccess:
            steps.accept(EmailLoginStep.tabIsRequired)
        }
        return newState
    }

    private func loginButtonDidTap(email: String, password: String) -> Observable<Mutation> {
        return self.loginUseCase.execute(req: .init(
            email: email,
            password: password
        ))
        .andThen(.just(Mutation.loginSuccess))
    }
}
