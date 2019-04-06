// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "OpenSubtitles",
    dependencies: [
        .package(
            url: "https://github.com/tris-code/aio.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/http.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/xml-rpc.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/compression.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/radix.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
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
