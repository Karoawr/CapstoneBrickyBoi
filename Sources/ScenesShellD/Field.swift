import Igis
import Scenes

class Field : RenderableEntityBase {
    var backgroundFillStyle = FillStyle(color:Color(.black))
    let backgroundRectangle = Rectangle(rect:Rect(topLeft:Point(), size:Size(width:0, height:0)), fillMode:.fill)//fillMode .clear does exist
    
    override func setup(canvas:Canvas){
        guard let canvasSize = canvas.canvasSize else{
            fatalError("\n \n canvasSize is required to setup field \n \n")
        }

        let midFieldLineWidth = 4

        backgroundRectangle.rect.size = canvasSize
    }
    override func render(canvas:Canvas){
        canvas.render(backgroundFillStyle, backgroundRectangle)
    }
}
