// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "murmurhash3",
    products: [
        .library(
            name: "murmurhash3",
            targets: ["murmurhash3"])
    ],
    targets: [
        .target(name: "murmurhash3"),
        .testTarget(
            name: "murmurhash3Tests",
            dependencies: ["murmurhash3"])
    ]
)
