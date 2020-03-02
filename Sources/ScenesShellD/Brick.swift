import Igis

class Brick{
    var hitsLeft : Int
    let rectangle : Rectangle
    let strokeStyle = StrokeStyle(color:Color(.white))
    var fillStyle = FillStyle(color:Color(.black))
    let width : Int
    let height : Int
        
    init(height:Int=40,width:Int=100, hitPoints:Int, position:Point=Point()){
        //allows height to be set if desired, else uses default values
        rectangle = Rectangle(rect:Rect(topLeft:position, size:Size(width:width, height:height)), fillMode:.fillAndStroke)
        self.width = width
        self.height = height
        
        hitsLeft = hitPoints
    }

    func changeColor(newColor:Color){//changes color of brick
        fillStyle = FillStyle(color:newColor)
    }

    func lowerHitPoints(lowerBy : Int = 1){//lowers hit point value of brick
        if hitsLeft >= 0{
            hitsLeft -= lowerBy
        }
    }

    func render(canvas:Canvas){
        canvas.render(strokeStyle, fillStyle, rectangle)
    }
}
