import Scenes
import Igis

class InteractionLayer : Layer{
    let ball : Ball
    let paddle : Paddle
    let bricks : Bricks

    override init(){
        
        ball = Ball()
        paddle = Paddle()
        bricks = Bricks()
        
        
        super.init()
        
        //setAlpha(alpha:Alpha(alphaValue:1.0))
        insert(entity:paddle, at:.front)
        insert(entity:bricks, at:.front)
        setAlpha(alpha:Alpha(alphaValue:0.75))
        insert(entity:ball, at:.front)
        

    }
}
