// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CopyPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CopyPackage",
            targets: ["CopyPackage"]),
    ],
    dependencies: [

        // This works solo
       .package(url: "https://github.com/Kitura/BlueSocket.git", from:"1.0.8"),

       // This works solo
       .package(url: "https://github.com/Bouke/NetService.git",.upToNextMajor(from: "0.8.1")),
        

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        .target(
            name: "CopyPackage",
            
            // These work solo
            //dependencies: ["NetService"]),
            //dependencies: [.product(name: "Socket", package: "BlueSocket")]),
        
            // When combined, these fail
            dependencies: ["NetService", .product(name: "Socket", package: "BlueSocket")]),

        .testTarget(
            name: "CopyPackageTests",
            dependencies: ["CopyPackage"]),
    ]
)
