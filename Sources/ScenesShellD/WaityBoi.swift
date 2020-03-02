import Scenes
import Igis

class WaityBoi : RenderableEntityBase{
    var backgroundFillStyle = FillStyle(color:Color(.black))
    let backgroundRectangle = Rectangle(rect:Rect(topLeft:Point(), size:Size(width:0, height:0)), fillMode:.fill)//fillMode .clear does exist
    var countDownVal = 5
    var countDownText : Text
    var playerOneControlInfo1 : Text
    var playerOneControlInfo2 : Text
    var playerTwoControlInfo1 : Text
    var playerTwoControlInfo2 : Text
    var textFillStyle = FillStyle(color:Color(.white))
    var textStrokeStyle = StrokeStyle(color:Color(.black))
    var framesPassed = 0

    override init(){
        print("Creating WaityBoi...")
        countDownText = Text(location:Point(), text:"", fillMode:.fillAndStroke)
        playerOneControlInfo1 = Text(location:Point(), text:"", fillMode:.fillAndStroke)
        playerOneControlInfo2 = Text(location:Point(), text:"", fillMode:.fillAndStroke)
        playerTwoControlInfo1 = Text(location:Point(), text:"", fillMode:.fillAndStroke)
        playerTwoControlInfo2 = Text(location:Point(), text:"", fillMode:.fillAndStroke)
    }
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize is required to setup WaityBoi \n \n")
        }
        backgroundRectangle.rect.size = canvasSize
        
        countDownText = Text(location:Point(x:canvasSize.width/2, y:canvasSize.height/2), text:"\(countDownVal)", fillMode:.fillAndStroke)
        
        playerOneControlInfo1 = Text(location:Point(x:canvasSize.width/4, y:canvasSize.height/2), text:"🡄", fillMode:.fillAndStroke)
        playerOneControlInfo2 = Text(location:Point(x:canvasSize.width/4, y:canvasSize.height/2), text:"Press the left arrow to go left!", fillMode:.fillAndStroke)
        
        playerTwoControlInfo1 = Text(location:Point(x:3*canvasSize.width/4, y:canvasSize.height/2), text:"🡆", fillMode:.fillAndStroke)
        playerTwoControlInfo2 = Text(location:Point(x:3*canvasSize.width/4, y:canvasSize.height/2), text:"Press the right arrow to go right!", fillMode:.fillAndStroke)
        
        countDownText.alignment = .center
        countDownText.baseline = .middle
        countDownText.font = "150pt Algerian"
        
        playerOneControlInfo1.alignment = .center
        playerOneControlInfo1.baseline = .bottom
        playerOneControlInfo1.font = "50pt Algerian"
        playerOneControlInfo2.alignment = .center
        playerOneControlInfo2.baseline = .top
        playerOneControlInfo2.font = "25pt Algerian"

        
        playerTwoControlInfo1.alignment = .center
        playerTwoControlInfo1.baseline = .bottom
        playerTwoControlInfo1.font = "50pt Algerian"
        playerTwoControlInfo2.alignment = .center
        playerTwoControlInfo2.baseline = .top
        playerTwoControlInfo2.font = "25pt Algerian"
        
        
    }

    override func calculate(canvasSize:Size){
        framesPassed += 1
        
        if framesPassed == 50{
            countDownVal = 4
        }else if framesPassed == 100{
            countDownVal = 3
        }else if framesPassed == 150{
            countDownVal = 2
        }else if framesPassed == 200{
            countDownVal = 1
        }
        
        countDownText.text = "\(countDownVal)"
        
    }
    
    override func render(canvas:Canvas){
        canvas.render(backgroundFillStyle, backgroundRectangle, textFillStyle, textStrokeStyle, countDownText, playerOneControlInfo1, playerOneControlInfo2, playerTwoControlInfo1, playerTwoControlInfo2)
    }
}
