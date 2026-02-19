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
		.package(url: "https://github.com/facebook/facebook-ios-sdk", .upToNextMinor(from: "18.0.0")),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.1.0-beta.23")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-4.1.0-beta.23.xcframework.zip",
			checksum: "f39d3c360f41f19f1b13e5294617598a9d962d936aef74e449da19a3059b60d6"
		)
	]
)