import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class MainReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {
        
    }

    public enum Action { }

    public enum Mutation { }

    public struct State { }
}

extension MainReactor {
    public func mutate(action: Action) -> Observable<Mutation> { }
    public func reduce(state: State, mutation: Mutation) -> State { }
}
