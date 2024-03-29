import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    dependencies: [
        .SPM.RxCocoa,
        .SPM.RxFlow,
        .SPM.RxSwift,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Swinject,
        .SPM.Moya,
        .SPM.RxMoya,
        .SPM.kingfisher,
        .SPM.KeychainSwift,
        .SPM.ReactorKit,
        .SPM.RxGesture,
        .SPM.TextFieldEffets
    ], sources: []
)
