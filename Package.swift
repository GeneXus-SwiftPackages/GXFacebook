// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXFacebook",
	platforms: [.iOS("12.0")],
	products: [
		.library(
			name: "GXFacebook",
			targets: ["GXFacebookWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/facebook/facebook-ios-sdk", .upToNextMinor(from: "17.0.1")),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.12")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXFacebook-2.0.12.xcframework.zip",
			checksum: "f547c810f208680fb6cb7c10a4f26c70982c7202c87d61829e2094705351aa9f"
		)
	]
)