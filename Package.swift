// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Logger",
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]
        ),
    ],
    targets: [
        .target(
            name: "Logger"
        ),
        .testTarget(
            name: "LoggerTests",
            dependencies: ["Logger"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
