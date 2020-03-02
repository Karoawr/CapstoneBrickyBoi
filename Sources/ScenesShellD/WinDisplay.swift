import Scenes
import Igis

class WinDisplay : RenderableEntityBase {
    let background = Rectangle(rect:Rect(topLeft:Point(), size:Size(width:0, height:0)), fillMode:.fill)
    var backgroundfillStyle = FillStyle(color:Color(.black))
    let text = Text(location:Point(),text:"", fillMode:.fillAndStroke)
    var textfillStyle = FillStyle(color:Color(.white))
    var textstrokeStyle = StrokeStyle(color:Color(.magenta))
    var black = false
    var framesPassed = 0
    
    override init(){
        text.font = "100pt Algerian"
    }

    override func render(canvas:Canvas){
        
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize required to render WinDisplay\n \n")
        }
        guard let layerOwner = owner as? WinningLayer,
              let sceneOwner = layerOwner.owner as? PlayerVictoryScene else{
            fatalError("Expected WinningLayer owner to setContainment()")
        }

        if layerOwner.framesPassed < 250{
            framesPassed += 1
        }
        
        if framesPassed == 5{
            if black{
                textfillStyle = FillStyle(color:Color(.black))
                textstrokeStyle = StrokeStyle(color:Color(.white))
                black = false
                framesPassed = 0
            }else{
                textfillStyle = FillStyle(color:Color(.white))
                textstrokeStyle = StrokeStyle(color:Color(.black))
                black = true
                framesPassed = 0
            }
        }
        
        background.rect.size = canvasSize
        text.location = Point(x:canvasSize.width/2, y:canvasSize.height/2)
        text.alignment = .center
        text.baseline = .middle
        text.text = "You Win!!!"
        
        canvas.render(backgroundfillStyle, background,
                      textfillStyle, textstrokeStyle, text)
        
    }
}
