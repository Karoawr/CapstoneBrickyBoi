import Scenes
import Igis

class TitleBackgroundLayer : Layer {
    let field : Field
    let titleBackgroundDisplay : TitleBackgroundDisplay

    override init(){
        print("Creating TitleBackgroundLayer...")
        field = Field()
        titleBackgroundDisplay = TitleBackgroundDisplay()

        super.init()
        
        insert(entity:field, at: .front)
        insert(entity:titleBackgroundDisplay, at: .front)
    }

    override func preCalculate(canvas:Canvas){
        guard let owner = owner as? TitleScene else{
            fatalError("TitleScene needed as owner in TitleBackgroundLayer")
        }
        setAlpha(alpha:Alpha(alphaValue:owner.alphaValue))
    }
}
