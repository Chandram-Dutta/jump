import raylib

struct App {
    static func run(_ screenWidth: Int32, _ screenHeight: Int32, _ title: String) {
        InitWindow(screenWidth, screenHeight, title)
        SetTargetFPS(60)

        let jetbrainsMonoFont: Font = LoadFont(
            "assets/JetBrainsMono/fonts/JetBrainsMono-Bold.ttf"
        )

        var body: Body = Body(font: jetbrainsMonoFont)

        while !WindowShouldClose() {
            let deltaTime = GetFrameTime()

            // Update
            body.update(deltaTime)

            // Draw
            BeginDrawing()
            ClearBackground(Colors.darkBlue)
            body.draw()
            EndDrawing()
        }

        // Clean up resources
        UnloadFont(jetbrainsMonoFont)
        CloseWindow()
    }
}

struct Body {
    private let font: Font
    private let header: Header
    private var jumpingCircle = JumpingCircle()

    init(font: Font) {
        self.font = font
        self.header = Header(font: font)
    }

    mutating func update(_ deltaTime: Float) {
        jumpingCircle.update(deltaTime)
    }

    func draw() {
        header.draw()
        jumpingCircle.draw()
    }
}
