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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-beta.17")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-3.0.0-beta.17.xcframework.zip",
			checksum: "0860831cce2e742c8a810906bec76eb055babbf02502c4678ee3cb16c2fb6502"
		)
	]
)