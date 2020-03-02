import Scenes
import Igis

class TitleBackgroundDisplay : RenderableEntityBase{
    var title : Text
    var textFillStyle = FillStyle(color:Color(.black))
    var textStrokeStyle = StrokeStyle(color:Color(.white))

    override init(){
        title = Text(location:Point(), text:"", fillMode:.fillAndStroke)
    }
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize is required to setup TitleBackgroundDisplay \n \n")
        }
        
        title = Text(location:Point(x:canvasSize.width/2, y:canvasSize.height/20), text:"Brick Breaker", fillMode:.fillAndStroke)
        title.font = "150pt Algerian"
        title.alignment = .center
        title.baseline = .top
    }

    override func render(canvas:Canvas){
        canvas.render(textFillStyle, textStrokeStyle, title)
    }
}
