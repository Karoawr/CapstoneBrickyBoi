import Igis
import Scenes

class Bricks : RenderableEntityBase{
    var bricks = [Brick]()
    var hitPoints = 10
    var currentXDisplacement = 0
    var currentYDisplacement = 0
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize required to setup Bricks \n \n")
        }
        
        let rows = 7
        let bricksPerLongRow = 10
        let bricksPerShortRow = 9
        var referenceBrick = Brick(hitPoints:hitPoints, position:Point())
        
        
        for currentRow in 0 ..< rows{
            if currentRow % 2 == 0{
                for _ in 0 ..< bricksPerLongRow{
                    let tempBrick = Brick(hitPoints:hitPoints, position:Point(x:(canvasSize.width/4)+currentXDisplacement,
                                                                              y:(canvasSize.height/4)+currentYDisplacement))
                    referenceBrick = tempBrick
                    currentXDisplacement+=tempBrick.width
                    bricks.append(tempBrick)
                }
                currentXDisplacement = referenceBrick.width/2
                currentYDisplacement += referenceBrick.height
            }else{
                for _ in 0 ..< bricksPerShortRow{
                    let tempBrick = Brick(hitPoints:hitPoints, position:Point(x:(canvasSize.width/4)+currentXDisplacement,
                                                                              y:(canvasSize.height/4)+currentYDisplacement))
                    currentXDisplacement+=tempBrick.width
                    referenceBrick = tempBrick
                    bricks.append(tempBrick)
                }
                currentXDisplacement = 0
                currentYDisplacement += referenceBrick.height
            }
        }
    }

    override func render(canvas:Canvas){
        for brick in bricks{
            //brick.changeColor(newColor:Color(.white))
            setAlpha(alpha:Alpha(alphaValue:(Double(brick.hitsLeft/10))))
            brick.render(canvas:canvas)
        }
    }

    override func calculate(canvasSize:Size){
        guard let layerOwner = owner as? InteractionLayer else{
            fatalError("\n \n Interaction Layer needed as owner in Bricks\n \n")
        }
        for brick in bricks{
            let containmentSet = brick.rectangle.rect.containment(target:layerOwner.ball.boundingRect())
            let ball = layerOwner.ball
            if containmentSet.contains(.contact){
                brick.lowerHitPoints()
                if containmentSet.contains(.overlapsLeft){

                }
            }
        }
    }
}

