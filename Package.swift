// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXFacebook",
	platforms: [.iOS("15.0")],
	products: [
		.library(
			name: "GXFacebook",
			targets: ["GXFacebookWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/facebook/facebook-ios-sdk", .upToNextMinor(from: "17.0.1")),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.1.0-beta.32")
	],
	targets: [
		.target(name: "GXFacebookWrapper",
				dependencies: [
					"GXFacebook",
					.product(name: "FacebookCore", package: "facebook-ios-sdk", condition: .when(platforms: [.iOS])),
					.product(name: "FacebookLogin", package: "facebook-ios-sdk", condition: .when(platforms: [.iOS])),
					.product(name: "FacebookShare", package: "facebook-ios-sdk", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXFacebook",
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-3.1.0-beta.32.xcframework.zip",
			checksum: "ec4ca15932ea701b96caaa448290b26ecca4bc47b91c785e047e3a593ec5c42c"
		)
	]
)