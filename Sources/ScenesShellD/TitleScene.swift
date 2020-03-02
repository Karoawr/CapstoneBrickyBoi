import Scenes
import Igis

class TitleScene : Scene{
    let titleBackgroundLayer : TitleBackgroundLayer
    let titleInteractionLayer : TitleInteractionLayer
    var alphaValue = 1.0
    
    override init(){
        print("Creating TitleScene...")
        titleBackgroundLayer = TitleBackgroundLayer()
        titleInteractionLayer = TitleInteractionLayer()
        
        super.init()
        
        
        
        insert(layer:titleBackgroundLayer, at:.front)
        insert(layer:titleInteractionLayer, at:.front)
    }
    
    override func preCalculate(canvas:Canvas){
        guard let director = owner as? Director else{
            fatalError("Director needed as owner in TitleScene")
        }
        if titleInteractionLayer.buttonPressed{
            alphaValue -= 0.05
        }
        if alphaValue <= 0.05{
            director.playGame()
        }
    }
    
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }
}
