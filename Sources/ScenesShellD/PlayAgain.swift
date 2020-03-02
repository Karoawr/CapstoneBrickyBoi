import Igis
import Scenes

class PlayAgain : RenderableEntityBase{
    let replayRequest : Button
    let buttonSize = Size(width:400, height:200)
    var framesPassed = 0
    var textToWhite = false
    var alphaVal = 1.0
    override init(){
        print("Creating PlayAgain...")
        replayRequest = Button(topLeft:Point(), size:buttonSize,
                               buttonStrokeStyle:StrokeStyle(color:Color(.white)),
                               buttonFillStyle:FillStyle(color:Color(.black)),
                               textOffset:Point(), label:"Play Again", font:"45pt Algerian",
                               fontFillStyle:FillStyle(color:Color(.white)))
        
        
    }
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("canvasSize required to setup PlayAgainDisplay")
        }
        replayRequest.rectangle.rect.topLeft = Point(x:(canvasSize.width/2)-(buttonSize.width/2), y:(canvasSize.height/4)-(buttonSize.height/2))
        replayRequest.text.location = Point(x:(replayRequest.rectangle.rect.topLeft.x)+(replayRequest.rectangle.rect.size.width/2),
                                            y:(replayRequest.rectangle.rect.topLeft.y)+(replayRequest.rectangle.rect.size.height/2))
        replayRequest.text.baseline = .middle
        replayRequest.text.alignment = .center
    }
    
    override func render(canvas:Canvas){
        replayRequest.render(canvas:canvas)
    }

    func switchColor(textToWhite:Bool){
        if textToWhite{
            replayRequest.buttonFillStyle = FillStyle(color:Color(.black))
            replayRequest.fontFillStyle = FillStyle(color:Color(.white))
        }else{
            replayRequest.buttonFillStyle = FillStyle(color:Color(.white))
            replayRequest.fontFillStyle = FillStyle(color:Color(.black))
        }
    }

    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }

    override func boundingRect() -> Rect {
        return replayRequest.rectangle.rect
    }
    
    override func onMouseClick(localLocation:Point){
        guard let layerOwner = owner as? WinningLayer else{
            fatalError("WinningLayer does not register as owner in PlayAgain")
        }
        layerOwner.buttonPressed = true
    }

    override func calculate(canvasSize:Size){
        guard let layerOwner = owner as? WinningLayer else{
            fatalError("WinningLayer does not register as owner in PlayAgain")
        }
        
        if (layerOwner.buttonPressed){
            alphaVal -= 0.05
        }
        if (alphaVal <= 0.1){
            layerOwner.alphaDone = true
        }
        framesPassed+=1
        
        if framesPassed == 30 {
            switchColor(textToWhite:textToWhite)
            textToWhite = !(textToWhite)
            framesPassed = 0
        }        
        
        setAlpha(alpha:Alpha(alphaValue:alphaVal))
    }
    
}
