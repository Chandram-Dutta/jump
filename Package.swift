// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Jump",
    products: [
        .library(name: "raylib", targets: ["raylib"]),
        .executable(name: "Jump", targets: ["Jump"]),
    ],
    targets: [
        .systemLibrary(
            name: "raylib", pkgConfig: "raylib",
            providers: [
                .brew(["raylib"])
            ]
        ),
        .executableTarget(
            name: "Jump",
            dependencies: ["raylib"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ]
)
