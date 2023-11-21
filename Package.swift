// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "Cargo",
  platforms: [.macOS(.v12), .iOS(.v13)],
  products: [
    .library(name: "Cargo", targets: [
      "Cargo"
    ])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2")
  ],
  targets: [
    .target(name: "Cargo", dependencies: [
      "Macros"
    ]),
    .macro(name: "Macros", dependencies: [
      .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
      .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
    ]),
    .testTarget(name: "MacroTests", dependencies: [
      "Macros",
      .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
    ])
  ]
)