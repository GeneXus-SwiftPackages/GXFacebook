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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230620165651")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-1.0.0-beta.20230620165651.xcframework.zip",
			checksum: "15f3a30415ceff26f2a74264e665e18f951e5170d117efcf6416368a5a1392d4"
		)
	]
)