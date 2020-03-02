import Scenes
import Igis

class Ball : RenderableEntityBase{
    var fillStyle = FillStyle(color:Color(.white))
    let circle = Ellipse(center:Point(), radiusX:15, radiusY:15, fillMode:.fill)
    var canvas : Canvas? = nil
    var framesPassed = 0
    

    var velocityX = Int.random(in:-5...5)
    
    var velocityY = Int.random(in:(-5)...(0))
    
    override func boundingRect() -> Rect{
        let topLeft = Point(x:circle.center.x - circle.radiusX,
                            y:circle.center.y - circle.radiusY)
        let size = Size(width:circle.radiusX*2, height: circle.radiusY*2)
        return Rect(topLeft:topLeft, size:size)
    }
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize is required to setup Ball \n \n")
        }
        
        circle.center = Point(x:canvasSize.width/2, y:4*canvasSize.height/5)
    }

    override func calculate(canvasSize:Size){
        guard let layerOwner = owner as? InteractionLayer,
              let sceneOwner = layerOwner.owner as? MainScene else {
            fatalError("Expected InteractionLayer owner to setContainment()")
        }
        framesPassed += 1
        while velocityX < 10 && velocityX > -10{
            velocityX = Int.random(in:-15...15)
        }
        circle.center.moveBy(offsetX:velocityX, offsetY:velocityY)

        //Bounce if necessary
        let canvasRect = Rect(topLeft:Point(), size:canvasSize)
        let containmentSet = canvasRect.containment(target:boundingRect())
        
        switch containmentSet{
        case let set where !set.intersection([.beyondLeft,.overlapsLeft]).isEmpty && velocityX < 0:
            velocityX = -velocityX
        case let set where !set.intersection([.beyondRight,.overlapsRight]).isEmpty && velocityX > 0:
            velocityX = -velocityX
        case let set where !set.intersection([.beyondTop,.overlapsTop]).isEmpty && velocityY < 0:
            velocityY = -velocityY
        case let set where !set.intersection([.beyondBottom,.overlapsBottom]).isEmpty && velocityY > 0:
            circle.center = Point(x:canvasSize.width/2, y:4*canvasSize.height/5)
        default:
            break
        }

        
        //change this to be horizontal, and include different angle responses
        let touchySetL =  layerOwner.paddle.boundingRect().containment(target:boundingRect())
        if touchySetL.contains(.contact){
            velocityY = -velocityY
        }

        
        if framesPassed == 100{
            if velocityX > 0{
                velocityX += 1
            }else{
                velocityX -= 1
            }
            if velocityY > 0{
                velocityY += 1
            }else{
                velocityY -= 1
            }
            framesPassed = 0
        }
        
    }

    override func render(canvas:Canvas){
        self.canvas = canvas
        canvas.render(fillStyle, circle)
    }

    func resetPosition(){
        circle.center = Point(x:canvas!.canvasSize!.width/2, y:canvas!.canvasSize!.height/2)
    }
    
}
