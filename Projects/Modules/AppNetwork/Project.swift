import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "AppNetwork",
    product: .framework,
    dependencies: [
        .Projects.core
    ]
)
