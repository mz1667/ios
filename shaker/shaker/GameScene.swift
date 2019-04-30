import SpriteKit

class GameScene: SKScene {
    
    private var shaker = SKSpriteNode()
    private var shakerWalkingFrames: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        buildShaker()
    }
    
    func buildShaker() {
        let shakerAnimatedAtlas = SKTextureAtlas(named: "shakeimages")
        var walkFrames: [SKTexture] = []
        
        let numImages = shakerAnimatedAtlas.textureNames.count
        for i in 1...numImages {
            let shakerTextureName = "shake\(i)"
            walkFrames.append(shakerAnimatedAtlas.textureNamed(shakerTextureName))
        }
        shakerWalkingFrames = walkFrames
        
        let firstFrameTexture = shakerWalkingFrames[0]
        shaker = SKSpriteNode(texture: firstFrameTexture)
        shaker.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(shaker)

    }
    
    func animateShaker() {
        shaker.run(SKAction.repeat(
            SKAction.animate(with: shakerWalkingFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true),count:5),
                 withKey:"walkingInPlaceShaker")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateShaker()
    }

}
