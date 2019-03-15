// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ignore",
    products: [
        .executable(name: "ignore", targets: ["ignore"]),
    ],
    dependencies: [
		.package(url: "https://github.com/orta/PackageConfig.git", from: "0.0.1"),
		.package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
		.package(url: "https://github.com/tuist/xcodeproj.git", from: "6.6.0"),
		.package(url: "https://github.com/kylef/PathKit", from: "0.9.2"),

//		.package(url: "https://github.com/f-meloni/Rocket", from: "0.0.1"), // dev
    ],
    targets: [
        .target(name: "ignore", dependencies: [
			"Logger", "xcodeproj", "PathKit", "PackageConfig"
		]),
        .testTarget(name: "ignoreTests", dependencies: ["ignore"]),
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfig([
	"ignore": [],
	"rocket": ["steps":
		[
			"hide_dev_dependencies",
			"git_add",
			["commit": ["message": "Releasing version $VERSION"]],
			"tag",
			"push",
			"unhide_dev_dependencies",
			"git_add",
			["commit": ["message": "Reveresed package dev dependencies"]],
			"push",
		]
	],
])
#endif
