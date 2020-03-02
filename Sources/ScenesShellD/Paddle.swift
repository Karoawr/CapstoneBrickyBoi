import Scenes
import Igis

class Paddle : RenderableEntityBase{
    let fillStyle = FillStyle(color:Color(.white))
    let strokeStyle = StrokeStyle(color:Color(.black))
    var rectangle : Rectangle
    let paddleSize = Size(width:150, height:15)
    var canvas : Canvas?
    
    override init(){
        rectangle = Rectangle(rect:Rect(topLeft:Point(), size:paddleSize), fillMode:.fillAndStroke)
        super.init()
    }
    
    override func setup(canvas:Canvas){
        self.canvas = canvas
        guard let canvasSize = canvas.canvasSize else{
            fatalError("canvasSize needed to render Paddle")
        }
        rectangle.rect.topLeft = Point(x:canvasSize.width/2, y:canvasSize.height-paddleSize.height)
    }
    
    override func boundingRect() -> Rect{
        return rectangle.rect
    }
    
    func right(){
        if rectangle.rect.topLeft.x >= 0{
            rectangle.rect.topLeft = Point(x:rectangle.rect.topLeft.x+50, y:rectangle.rect.topLeft.y)
        }
    }
    
    func left(){
        if rectangle.rect.topLeft.x <= (canvas!.canvasSize!.width-paddleSize.width){
             rectangle.rect.topLeft = Point(x:rectangle.rect.topLeft.x-50, y:rectangle.rect.topLeft.y)
        }
    }
    
    override func render(canvas:Canvas){
        canvas.render(fillStyle, strokeStyle, rectangle)
    }
}
