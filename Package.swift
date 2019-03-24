// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ignore",
    products: [
        .executable(name: "ignore", targets: ["Ignore"]),
		.library(name: "IgnoreConfig", type: .dynamic, targets: ["IgnoreConfig"]),
    ],
    dependencies: [
		.package(url: "https://github.com/orta/PackageConfig.git", from: "0.9.0"),
		.package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
		.package(url: "https://github.com/tuist/xcodeproj.git", from: "6.6.0"),
		.package(url: "https://github.com/kylef/PathKit", from: "0.9.2"),

//		.package(url: "https://github.com/f-meloni/Rocket", from: "0.0.1"), // dev
    ],
    targets: [
        .target(name: "Ignore", dependencies: [
			"Logger",
			"xcodeproj",
			"PathKit",
			"IgnoreConfig",
		]),
		.target(name: "IgnoreConfig", dependencies: ["PackageConfig"]),

//		.target(name: "PackageConfigs", dependencies: ["IgnoreConfig"]),
    ]
)

#if canImport(IgnoreConfig)
import IgnoreConfig

IgnoreConfig(excludedTargets: []).write()
#endif
