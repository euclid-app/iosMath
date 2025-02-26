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
            publicHeadersPath: "lib",  // 保留原有设置
            cSettings: [
                // 全面的头文件搜索路径配置
                .headerSearchPath("."),
                .headerSearchPath("../"),  // 添加上层目录
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("render/internal"),  // 确保这条路径正确
                .headerSearchPath("font"),
                .headerSearchPath("include"),
                .headerSearchPath("include/render"),
                .headerSearchPath("include/render/internal"),
                .unsafeFlags(["-I../iosMath/render/internal"])  // 添加额外安全路径
            ]
        )
    ],
    cLanguageStandard: .gnu99
)