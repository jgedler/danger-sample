// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Danger",
    products: [
        .library(name: "Danger", targets: ["Danger"])
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),
        .package(url: "https://github.com/danger/swiftlint.git", from: "0.33.0"),
        .package(url: "https://github.com/perrystreetsoftware/Harmonize.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "Danger",
            dependencies: [
                "Danger",
                "DangerSwiftLint",
                "Harmonize"
            ],
            path: ".",
            sources: [
                "Dangerfile.swift",
                "Rules"
            ]
        )
    ]
)
