// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryEncoder",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BinaryEncoder",
            targets: ["BinaryEncoder"]),
    ],
    dependencies: [
        .package(name: "Binary", url: "git@github.com:spacenation/swift-binary.git", from: "0.1.2"),
        .package(name: "Functions", url: "git@github.com:spacenation/swift-functions.git", .upToNextMajor(from: "0.5.0")),
        .package(name: "Currying", url: "git@github.com:spacenation/swift-currying.git", .upToNextMajor(from: "0.1.0")),
        .package(name: "List", url: "git@github.com:spacenation/swift-list.git", .upToNextMajor(from: "0.3.3"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BinaryEncoder",
            dependencies: ["Binary", "Functions", "Currying", "List"]),
        .testTarget(
            name: "BinaryEncoderTests",
            dependencies: ["BinaryEncoder"]),
    ]
)
