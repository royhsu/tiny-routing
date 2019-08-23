// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "TinyRouting",
    products: [
        .library(
            name: "TinyRouting",
            targets: [ "TinyRouting", ]
        ),
    ],
    targets: [
        .target(name: "TinyRouting"),
        .testTarget(
            name: "TinyRoutingTests",
            dependencies: [ "TinyRouting", ]
        ),
    ]
)
