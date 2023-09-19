// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "SoftphoneSwiftPackage-saas"
let sdkVersion = Version("1.1.38")
let facadeVersion = "1.1.39"
let facadeChecksum = "0d8028b638d2d7db462afa5ec96714e81e5d693ec45912e9f76fe83e94c94ac9"

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
