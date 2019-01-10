// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoronaErrors",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CoronaErrors",
            targets: ["CoronaErrors"]),
        .library(
            name: "CoronaErrorsTestHooks",
            targets: ["CoronaErrorsTestHooks"])
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "CoronaErrors",
            dependencies: []),
        .target(
            name: "CoronaErrorsTestHooks",
            dependencies: ["CoronaErrors"]),
        .testTarget(
            name: "CoronaErrorsTests",
            dependencies: ["CoronaErrors", "CoronaErrorsTestHooks"]),
    ]
)
