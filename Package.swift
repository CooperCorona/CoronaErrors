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
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "CoronaErrors",
            dependencies: []),
        .testTarget(
            name: "CoronaErrorsTests",
            dependencies: ["CoronaErrors"]),
    ]
)
