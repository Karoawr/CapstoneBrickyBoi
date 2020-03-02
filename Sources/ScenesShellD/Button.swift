import Igis

class Button {

    public let rectangle : Rectangle
    public let text : Text
    public let buttonStrokeStyle : StrokeStyle
    public var buttonFillStyle : FillStyle
    public var fontFillStyle : FillStyle

    init(topLeft:Point, size:Size, buttonStrokeStyle:StrokeStyle, buttonFillStyle:FillStyle,
         textOffset:Point, label:String, font:String, fontFillStyle:FillStyle) {
        // Form the shape of the button
        let rect = Rect(topLeft:topLeft, size:size)
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        self.buttonStrokeStyle = buttonStrokeStyle
        self.buttonFillStyle = buttonFillStyle
        self.fontFillStyle = fontFillStyle

        // Form the label for the button
        let textLocation = Point(x:topLeft.x+textOffset.x, y:topLeft.y+textOffset.y)
        text = Text(location:textLocation, text:label)
        text.font = font
    }
    func hitTest(location:Point) -> Bool {
        let xRange = rectangle.rect.topLeft.x ..< rectangle.rect.topLeft.x+rectangle.rect.size.width
        let yRange = rectangle.rect.topLeft.y ..< rectangle.rect.topLeft.y+rectangle.rect.size.height
        return xRange.contains(location.x) && yRange.contains(location.y)
    }
    func render(canvas:Canvas) {
        canvas.render(buttonStrokeStyle, buttonFillStyle, rectangle, fontFillStyle, text)
    }
}
