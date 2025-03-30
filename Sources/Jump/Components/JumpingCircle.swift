import Foundation
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
    var justJumped: Bool = false

    mutating func update(_ deltaTime: Float) {

        let jumpRequested = IsKeyDown(Int32(KEY_W.rawValue))
        let moveLeft = IsKeyDown(Int32(KEY_A.rawValue))
        let moveRight = IsKeyDown(Int32(KEY_D.rawValue))

        if moveLeft {
            horizontalVelocity -= horizontalAcceleration
        }
        if moveRight {
            horizontalVelocity += horizontalAcceleration
        }

        horizontalVelocity *= pow(0.98, deltaTime * 60.0)

        circleX += horizontalVelocity * deltaTime * 60.0

        velocity += gravity * deltaTime * 60.0

        circleY += velocity * deltaTime * 60.0

        var isOnGround = false

        if circleY >= Float(GetScreenHeight()) - radius {
            circleY = Float(GetScreenHeight()) - radius
            isOnGround = true

            if velocity > 1 {
                velocity = -velocity * bounceFactor
            } else {
                velocity = 0
            }

            horizontalVelocity *= friction
            justJumped = false
        } else {

        }

        if circleX < radius {
            circleX = radius
            horizontalVelocity = -horizontalVelocity * 0.5
        }
        if circleX > Float(GetScreenWidth()) - radius {
            circleX = Float(GetScreenWidth()) - radius
            horizontalVelocity = -horizontalVelocity * 0.5
        }

        if jumpRequested && isOnGround && !justJumped {
            velocity = jumpForce
            justJumped = true
        }
    }

    func draw() {
        DrawCircle(Int32(circleX), Int32(circleY), radius, Colors.orange)
    }
}
