import raylib

struct JumpingCircle {
    var circleY: Float = Float(GetScreenHeight()) - 50
    var circleX: Float = Float(GetScreenWidth()) / 2
    var velocity: Float = 0
    var horizontalVelocity: Float = 0
    var gravity: Float = 0.8
    let jumpForce: Float = -15
    let radius: Float = 25
    let bounceFactor: Float = 0.6
    let horizontalAcceleration: Float = 0.5
    let friction: Float = 0.92

    mutating func update() {
        if IsKeyPressed(Int32(KEY_W.rawValue)) && circleY >= Float(GetScreenHeight()) - radius {
            velocity = jumpForce
        }

        velocity += gravity
        circleY += velocity

        if circleY > Float(GetScreenHeight()) - radius {
            circleY = Float(GetScreenHeight()) - radius

            if velocity > 1 {
                velocity = -velocity * bounceFactor
            } else {
                velocity = 0
            }

            horizontalVelocity *= friction
        }

        if IsKeyDown(Int32(KEY_A.rawValue)) {
            horizontalVelocity -= horizontalAcceleration
        }
        if IsKeyDown(Int32(KEY_D.rawValue)) {
            horizontalVelocity += horizontalAcceleration
        }

        horizontalVelocity *= 0.98

        circleX += horizontalVelocity

        if circleX < radius {
            circleX = radius
            horizontalVelocity = -horizontalVelocity * 0.5
        }
        if circleX > Float(GetScreenWidth()) - radius {
            circleX = Float(GetScreenWidth()) - radius
            horizontalVelocity = -horizontalVelocity * 0.5
        }
    }

    func draw() {
        DrawCircle(Int32(circleX), Int32(circleY), radius, Colors.orange)
    }
}
