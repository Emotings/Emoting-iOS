import ReactorKit
import RxSwift
import RxCocoa
import Domain
import RxFlow
import Core

public final class ChatReactor: BaseReactor, Stepper {
    public let steps = PublishRelay<Step>()
    public let initialState = State()
    private let disposeBag = DisposeBag()
    public init() {}

    public enum Action { }

    public enum Mutation { }

    public struct State { }
}
