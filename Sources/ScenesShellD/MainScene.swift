import Scenes
import Igis

class MainScene : Scene{
    let transitionLayer : TransitionLayer
    let backgroundLayer : BackgroundLayer
    let interactionLayer : InteractionLayer
    let foregroundLayer : ForegroundLayer
    var framesPassed = 0
    
    override init() {
        print("Creating MainScene...")
        transitionLayer = TransitionLayer()
        backgroundLayer = BackgroundLayer()
        interactionLayer = InteractionLayer()
        foregroundLayer = ForegroundLayer()

        super.init()
        insert(layer:transitionLayer, at:.front)
    }

    //override this for scene as well as any and all layers and objects needed
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }

    override func preCalculate(canvas:Canvas){
        framesPassed += 1
        
        if framesPassed == 250{
            insert(layer:backgroundLayer, at:.front)
            insert(layer:interactionLayer, at:.front)
            insert(layer:foregroundLayer, at:.front)
        }
    }
    

    func movePaddle(direction:Direction){
        if direction == .right{
            interactionLayer.paddle.right()
        }
        if direction == .left{
            interactionLayer.paddle.left()
        }
    }
    
}
