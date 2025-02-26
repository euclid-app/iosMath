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
            publicHeadersPath: "lib",  // 根据项目结构可能需要调整
            cSettings: [
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("render/internal"),  // 添加这个路径！
                .headerSearchPath("font")
            ]
        )
    ],
    cLanguageStandard: .gnu99
)