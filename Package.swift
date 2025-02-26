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
                "render/MTFontManager.m",  // 如需要排除
                "info.plist",
                "lib/iosMath-prefix.pch"
            ],
            resources: [
                .copy("font")
            ],
            publicHeadersPath: "include",  // 将公共头文件路径改为include
            cSettings: [
                // 扩展头文件搜索路径，确保所有可能的目录都被包含
                .headerSearchPath("."),
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("render/internal"),
                .headerSearchPath("font"),
                .headerSearchPath("include"),
                .headerSearchPath("include/render"),
                .headerSearchPath("include/render/internal")
            ]
        )
    ],
    cLanguageStandard: .gnu99
)