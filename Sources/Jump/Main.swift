import raylib

@main
struct Main {
    static func main() {

        let screenWidth: Int32 = 800
        let screenHeight: Int32 = 450

        App.run(screenWidth, screenHeight, "Jump")
    }
}
