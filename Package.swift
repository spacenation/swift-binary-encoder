// swift-tools-version:5.3
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
        .package(name: "Functional", url: "git@github.com:spacenation/functional.swift.git", from: "0.3.4"),
        .package(name: "Binary", url: "git@github.com:spacenation/binary-swift.git", from: "0.1.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BinaryEncoder",
            dependencies: ["Binary", "Functional"]),
        .testTarget(
            name: "BinaryEncoderTests",
            dependencies: ["BinaryEncoder"]),
    ]
)
