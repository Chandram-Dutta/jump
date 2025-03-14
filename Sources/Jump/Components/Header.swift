import raylib

struct Header {
    private let font: Font

    init(font: Font) {
        self.font = font
    }

    func draw() {
        DrawTextEx(
            font, "Jump v(0.1)", Vector2(x: 10, y: 10), 20, 2, Colors.orange)
        DrawTextEx(
            font, "Built using raylib and Swift,", Vector2(x: 10, y: 40), 18, 1,
            Colors.orange)
        DrawTextEx(
            font, "W: Jump, A: Left, D: Right.", Vector2(x: 10, y: 60), 18, 1,
            Colors.orange)
    }
}
