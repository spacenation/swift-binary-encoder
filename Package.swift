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
        .package(name: "Encoder", url: "git@github.com:spacenation/swift-encoder.git", from: "0.2.3"),
        .package(name: "Binary", url: "git@github.com:spacenation/swift-binary.git", from: "0.1.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BinaryEncoder",
            dependencies: ["Encoder", "Binary"]),
        .testTarget(
            name: "BinaryEncoderTests",
            dependencies: ["BinaryEncoder"]),
    ]
)
