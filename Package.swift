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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.1.0-beta.22")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-5.1.0-beta.22.xcframework.zip",
			checksum: "048e4f04774657b35a82d56a2d80ce9bd222eaf10835107eae08fa6b59a42e45"
		)
	]
)