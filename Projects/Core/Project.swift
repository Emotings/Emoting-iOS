import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Core",
    product: .framework,
    dependencies: [
        .Modules.thirdPartyLib
    ]
)
