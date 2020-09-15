// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private var targets: [Target] = [
    .target(
        name: "AccountsUI",
        dependencies: [],
        resources: [
            .process("Color.xcassets")
        ]
    ),
]

#if os(iOS)
    targets.append(
        .testTarget(
            name: "AccountsUITests",
            dependencies: ["AccountsUI"]
        )
    )
#endif

let package = Package(
    name: "AccountsUI",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AccountsUI",
            targets: ["AccountsUI"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: targets
)
