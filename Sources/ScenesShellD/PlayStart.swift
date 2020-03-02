import Igis
import Scenes

class PlayStart : RenderableEntityBase{
    let playRequest : Button
    let buttonSize = Size(width:800, height:400)
    var framesPassed = 0
    var textToWhite = false
    
    override init(){
        print("Creating PlayStart...")
        playRequest = Button(topLeft:Point(), size:buttonSize,
                               buttonStrokeStyle:StrokeStyle(color:Color(.white)),
                               buttonFillStyle:FillStyle(color:Color(.black)),
                               textOffset:Point(), label:"Press to Start", font:"75pt Algerian",
                               fontFillStyle:FillStyle(color:Color(.white)))
        
        
    }
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("canvasSize required to setup PlayAgainDisplay")
        }
        playRequest.rectangle.rect.topLeft = Point(x:(canvasSize.width/2)-(buttonSize.width/2), y:(2*canvasSize.height/3)-(buttonSize.height/2))
        playRequest.text.location = Point(x:(playRequest.rectangle.rect.topLeft.x)+(playRequest.rectangle.rect.size.width/2),
                                          y:(playRequest.rectangle.rect.topLeft.y)+(playRequest.rectangle.rect.size.height/2))
        playRequest.text.baseline = .middle
        playRequest.text.alignment = .center
    }
    
    override func render(canvas:Canvas){
        playRequest.render(canvas:canvas)
    }
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }

    override func boundingRect() -> Rect {
        return playRequest.rectangle.rect
    }
    
    override func onMouseClick(localLocation:Point){
        guard let layerOwner = owner as? TitleInteractionLayer  else{
            fatalError("TitleInteractionLayer  does not register as owner in PlayStart")
        }
        layerOwner.buttonPressed = true
    }

    override func calculate(canvasSize:Size){
        framesPassed += 1
        if framesPassed == 50 {
            switchColor(textToWhite:textToWhite)
            textToWhite = !(textToWhite)
            framesPassed = 0
        }
    }

    func switchColor(textToWhite:Bool){
        if textToWhite{
            playRequest.buttonFillStyle = FillStyle(color:Color(.black))
            playRequest.fontFillStyle = FillStyle(color:Color(.white))
        }else{
            playRequest.buttonFillStyle = FillStyle(color:Color(.white))
            playRequest.fontFillStyle = FillStyle(color:Color(.black))
        }
    }

}
