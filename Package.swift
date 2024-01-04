// swift-tools-version: 5.7
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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-beta.11")
	],
	targets: [
		.target(name: "GXFacebookWrapper",
				dependencies: [
					"GXFacebook",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXFacebook",
			url: "https://pkgs.genexus.dev/iOS/beta/GXFacebook-1.4.0-beta.11.xcframework.zip",
			checksum: "0ba96fbd7bed0e5c7ba50a63e267e0afee9666636e658c676c1285174a0ddcdb"
		)
	]
)