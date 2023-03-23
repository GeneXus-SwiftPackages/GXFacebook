// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXFacebook",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXFacebook",
			targets: ["GXFacebookWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", branch: "beta")
	],
	targets: [
		.target(name: "GXFacebookWrapper",
				dependencies: [
					"GXFacebook",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXFacebook",
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-1.0.0-beta+20230323132058.xcframework.zip",
			checksum: "0b6e815ff6939bd9be3a6a3e676eada0fc2b054538599585c08c1edce0750ee7"
		)
	]
)