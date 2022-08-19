// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestShopApp",
    defaultLocalization: "en",
    platforms: [
            .iOS(.v13)
    ],
    products: [
        .library(
            name: "TestShopApp",
            targets: ["TestShopApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.4.3")),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk", from: "9.0.0")
    ],
    targets: [
        .target(
            name: "TestShopApp",
            dependencies: [
                "Alamofire",
                .product(name: "FirebaseAnalytics", package: "Firebase"),
                .product(name: "FirebaseCrashlytics", package: "Firebase")
            ],
            resources: [
                .copy("Resources")
            ]),
        .testTarget(
            name: "TestShopAppTests",
            dependencies: ["TestShopApp"])
    ]
)
