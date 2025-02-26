// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iosMath",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "iosMath",
            targets: ["iosMath"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iosMath",
            path: "iosMath",
            exclude: [
                "render/MTFontManager.m",
                "info.plist",
                "lib/iosMath-prefix.pch"
            ],
            resources: [
                .copy("font")
            ],
            publicHeadersPath: "lib",
            cSettings: [
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("render/internal"),
                .headerSearchPath("font"),
                .unsafeFlags(["-Wno-error", "-w"]) // 忽略警告和错误
            ],
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ],
            plugins: [
                .plugin(name: "HeaderCopyPlugin", package: "iosMath")
            ]
        ),
        .plugin(
            name: "HeaderCopyPlugin",
            capability: .buildTool(),
            dependencies: []
        )
    ],
    cLanguageStandard: .gnu99
)