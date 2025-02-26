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
                "render/MTFontManager.m",  // 这个文件已经被弃用
                "font/fontinfo.json",      // 排除不需要的资源
                "info.plist",              // 排除不需要的文件
                "lib/iosMath-prefix.pch"   // 排除预编译头文件
            ],
            resources: [
                .copy("font")  // 将font目录作为资源复制
            ],
            publicHeadersPath: "lib",
            cSettings: [
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("font")
            ]
        )
    ],
    cLanguageStandard: .gnu99
)