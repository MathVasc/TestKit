// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestKit",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "TestKit",
            targets: ["TestKit"]
        ),
    ],
    targets: [
        .target(
            name: "TestKit",
            dependencies: []
        ),
        .testTarget(
            name: "TestKitTests",
            dependencies: ["TestKit"],
            resources: [
                .process("Utils/Loader/Resources/")
            ]
        ),
    ]
)
