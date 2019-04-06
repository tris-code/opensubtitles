// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "OpenSubtitles",
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/aio.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/http.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/xml-rpc.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/compression.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/radix.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "OpenSubtitles",
            dependencies: ["XMLRPC", "Compression", "HTTP", "File", "Base64"]),
        .testTarget(
            name: "OpenSubtitlesTests",
            dependencies: ["OpenSubtitles", "Test"]),
    ]
)
