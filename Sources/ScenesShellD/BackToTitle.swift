import Igis
import Scenes

class BackToTitle : RenderableEntityBase{
    let quitRequest : Button
    let buttonSize = Size(width:400, height:200)
    var framesPassed = 0
    var textToWhite = false
    var alphaVal = 1.0
    override init(){
        print("Creating BackToTitle...")
        quitRequest = Button(topLeft:Point(), size:buttonSize,
                             buttonStrokeStyle:StrokeStyle(color:Color(.white)),
                             buttonFillStyle:FillStyle(color:Color(.black)),
                             textOffset:Point(), label:"Quit", font:"45pt Algerian",
                             fontFillStyle:FillStyle(color:Color(.white)))
        
        
    }
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("canvasSize required to setup BackToTitleDisplay")
        }
        quitRequest.rectangle.rect.topLeft = Point(x:(canvasSize.width/2)-(buttonSize.width/2), y:(3*canvasSize.height/4)-(buttonSize.height/2))
        quitRequest.text.location = Point(x:(quitRequest.rectangle.rect.topLeft.x)+(quitRequest.rectangle.rect.size.width/2),
                                          y:(quitRequest.rectangle.rect.topLeft.y)+(quitRequest.rectangle.rect.size.height/2))
        quitRequest.text.baseline = .middle
        quitRequest.text.alignment = .center
    }
    
    override func render(canvas:Canvas){
        quitRequest.render(canvas:canvas)
    }
    
    func switchColor(textToWhite:Bool){
        if textToWhite{
            quitRequest.buttonFillStyle = FillStyle(color:Color(.black))
            quitRequest.fontFillStyle = FillStyle(color:Color(.white))
        }else{
            quitRequest.buttonFillStyle = FillStyle(color:Color(.white))
            quitRequest.fontFillStyle = FillStyle(color:Color(.black))
        }
    }
    
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }
    
    override func boundingRect() -> Rect {
        return quitRequest.rectangle.rect
    }
    
    override func onMouseClick(localLocation:Point){
        guard let layerOwner = owner as? WinningLayer else{
            fatalError("WinningLayer does not register as owner in BackToTitle")
        }
        layerOwner.titleButtonPressed = true
    }
    
    override func calculate(canvasSize:Size){
        guard let layerOwner = owner as? WinningLayer else{
            fatalError("WinningLayer does not register as owner in BackToTitle")
        }
        
        if (layerOwner.titleButtonPressed){
            alphaVal -= 0.05
        }
        if (alphaVal <= 0.1){
            layerOwner.titleAlphaDone = true
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
