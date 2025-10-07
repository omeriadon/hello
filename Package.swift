// swift-tools-version:5.4.3
import PackageDescription

let package = Package(
	name: "hello",
	platforms: [
		.macOS(.v12),
	],
	dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: .init("4.0.0")!),
        .package(url: "https://github.com/apple/swift-nio.git", .upToNextMajor(from: "2.32.0")),
	],
	targets: [
		.executableTarget(
			name: "hello",
			dependencies: [
				.product(name: "Vapor", package: "vapor"),
				.product(name: "NIOCore", package: "swift-nio"),
				.product(name: "NIOPosix", package: "swift-nio"),
			]
//			swiftSettings: swiftSettings
		),
	]
)

//var swiftSettings: [SwiftSetting] { [
//	.enableUpcomingFeature("ExistentialAny"),
//] }
