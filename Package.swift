// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EZAsyncCodableJson",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "EZAsyncCodableJson",
            targets: ["EZAsyncCodableJson"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Flight-School/AnyCodable",
            from: "0.6.0"),
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.6.4")
        ),
        .package(
            url: "https://github.com/michaeleisel/ZippyJSON.git",
            .upToNextMajor(from: "1.2.10")
        )
    ],
    targets: [
        .target(
            name: "EZAsyncCodableJson",
            dependencies: ["AnyCodable", "Alamofire", "ZippyJSON"]),
        .testTarget(
            name: "EZAsyncCodableJsonTests",
            dependencies: ["EZAsyncCodableJson"]),
    ]
)
