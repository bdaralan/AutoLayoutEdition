// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoLayoutEdition",
    products: [
        .library(name: "AutoLayoutEdition", targets: ["AutoLayoutEdition"])
    ],
    targets: [
        .target(name: "AutoLayoutEdition", dependencies: []),
        .testTarget(name: "AutoLayoutEditionTests", dependencies: ["AutoLayoutEdition"])
    ]
)
