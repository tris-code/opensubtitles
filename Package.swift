// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "OpenSubtitles",
    dependencies: [
        .package(
            url: "https://github.com/swift-core/http.git",
            .branch("master")),
        .package(
            url: "https://github.com/swift-core/xml-rpc.git",
            .branch("master")),
        .package(
            url: "https://github.com/swift-core/compression.git",
            .branch("master")),
        .package(
            url: "https://github.com/swift-core/test.git",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "OpenSubtitles",
            dependencies: ["XMLRPC", "Compression", "Client"]),
        .testTarget(
            name: "OpenSubtitlesTests",
            dependencies: ["OpenSubtitles", "Test"]),
    ]
)