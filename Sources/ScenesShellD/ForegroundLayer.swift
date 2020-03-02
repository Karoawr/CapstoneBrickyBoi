import Scenes
import Igis

class ForegroundLayer : Layer{ //replace score with lives remaining, score will not be used
    
    
    override init(){
        
        super.init()

        setAlpha(alpha:Alpha(alphaValue:0.5))
    }
    
}
