import Scenes
import Igis

class WinningLayer : Layer {
    let winDisplay : WinDisplay
    let backgroundDisplay : Field
    let playAgainDisplay : PlayAgain
    let backToTitleDisplay : BackToTitle
    var framesPassed = 0
    var buttonPressed = false
    var titleButtonPressed = false
    var alphaDone = false
    var titleAlphaDone = false
    //let playAgainDisplay : 
    
    override init(){
        print("Creating WinningLayer...")
        winDisplay = WinDisplay()
        backgroundDisplay = Field()
        playAgainDisplay = PlayAgain()
        backToTitleDisplay = BackToTitle()
        super.init()
        insert(entity:winDisplay, at:.front)
    }
    override func preCalculate(canvas:Canvas){
        framesPassed += 1
    }
    override func preRender(canvas:Canvas){
        guard let sceneOwner = owner as? PlayerVictoryScene else{
            fatalError("Need Scene to be owner in Winning Layer")
        }
        if framesPassed == 125{
            insert(entity:backgroundDisplay, at:.front)
            insert(entity:playAgainDisplay, at:.front)
            insert(entity:backToTitleDisplay, at:.front)
        }
        if buttonPressed && alphaDone{
            sceneOwner.backToPlaying()
        }
        if titleButtonPressed && titleAlphaDone{
            sceneOwner.backToTitle()
        }
    }
    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }
}
