import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let targets: [Target] = [
    .init(
        name: env.targetName,
        platform: env.platform,
        product: .app,
        bundleId: "\(env.organizationName)",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: .sources,
        resources: .resources,
        scripts: [],
        dependencies: [
            .Projects.flow
        ],
        settings: .settings(base: env.baseSetting)
    )
]

let project = Project(
    name: env.targetName,
    organizationName: env.organizationName,
    settings: .settings(base: .codeSign),
    targets: targets
)
