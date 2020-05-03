// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "OpenSubtitles",
    dependencies: [
        .package(name: "HTTP"),
        .package(name: "RPC"),
        .package(name: "AIO"),
        .package(name: "Radix"),
        .package(name: "DCompression"),
        .package(name: "Test")
    ],
    targets: [
        .target(
            name: "OpenSubtitles",
            dependencies: [
                "HTTP",
                "DCompression"
                .product(name: "XMLRPC", package: "RPC"),
                .product(name: "File", package: "AIO"),
                .product(name: "Base64", package: "Radix")]),
        .testTarget(
            name: "OpenSubtitlesTests",
            dependencies: ["OpenSubtitles", "Test"]),
    ]
)

// MARK: - custom package source

#if canImport(ObjectiveC)
import Darwin.C
#else
import Glibc
#endif

extension Package.Dependency {
    enum Source: String {
        case local, swiftcore, github

        static var `default`: Self { .local }

        var baseUrl: String {
            switch self {
            case .local: return "../"
            case .swiftcore: return "https://swiftcore.dev/"
            case .github: return "https://github.com/swift-core/"
            }
        }

        func url(for name: String) -> String {
            return self == .local
                ? baseUrl + name.lowercased()
                : baseUrl + name.lowercased() + ".git"
        }
    }

    static func package(name: String) -> Package.Dependency {
        guard let pointer = getenv("SWIFTCORE") else {
            return .package(name: name, source: .default)
        }
        guard let source = Source(rawValue: String(cString: pointer)) else {
            fatalError("Invalid source. Use local, swiftcore or github")
        }
        return .package(name: name, source: source)
    }

    static func package(name: String, source: Source) -> Package.Dependency {
        return source == .local
            ? .package(name: name, path: source.url(for: name))
            : .package(name: name, url: source.url(for: name), .branch("dev"))
    }
}
