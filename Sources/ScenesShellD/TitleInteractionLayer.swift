import Scenes
import Igis

class TitleInteractionLayer : Layer {
    
    let playStart : PlayStart
    var buttonPressed = false
    
    override init(){
        print("Creating TitleInteractionLayer...")

        playStart = PlayStart()
        
        super.init()

        insert(entity:playStart, at:.front)        
    }
    
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }

    override func preCalculate(canvas:Canvas){
        guard let owner = owner as? TitleScene else{
            fatalError("TitleScene needed as owner in TitleInteractionLayer")
        }
        setAlpha(alpha:Alpha(alphaValue:owner.alphaValue))
    }
}
