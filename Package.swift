// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "SoftphoneSwiftPackage-saas"
let sdkVersion = Version("1.1.31")
let facadeVersion = "1.1.24"
let facadeChecksum = "c25e9fa60d0d2f597ea73f1fc88536851197a612302de01ace92d28e36d82bac"

let package = Package(
    name: "deliveryhero-softphonefacade",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SoftphoneFacade",
            targets: ["SoftphoneFacadeTargets"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: sdkName, url: "https://github.com/acrobits/\(sdkName)", .exact(sdkVersion))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "SoftphoneFacadeTargets",
               dependencies: [
                              .target(name: "SoftphoneFacadeLib"),
                              .product(name: sdkName, package: sdkName)
                              ],
                linkerSettings: [
                    .linkedFramework("SoftphoneFacadeLib")
                ]),
        
        .binaryTarget(
            name: "SoftphoneFacadeLib",
            url: "https://dist.acrobits.cz/deliveryhero-softphonefacade/SoftphoneFacadeLib.xcframework-\(facadeVersion).zip",
            checksum: facadeChecksum
        )
    ]
)
