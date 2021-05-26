// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Elapse",
    products: [
        .library(name: "Elapse-Auto", targets: ["Elapse"]),
        .library(name: "Elapse", type: .dynamic, targets: ["Elapse"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Elapse",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ElapseTests",
            dependencies: ["Elapse"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v4, .v4_2]
)
