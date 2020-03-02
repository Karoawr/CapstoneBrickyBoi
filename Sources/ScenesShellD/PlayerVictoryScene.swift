import Scenes

class PlayerVictoryScene : Scene {
    let winningLayer : WinningLayer
    
    override init(){
        print("Creating PlayerVictoryScene...")
        winningLayer = WinningLayer()
        super.init()
        insert(layer:winningLayer, at:.front)
    }

    override func wantsMouseEvents() -> MouseEventTypeSet{
        return [.click]
    }
    
    func backToPlaying(){
        guard let directorOwner = owner as? Director else{
            fatalError("need director as owner in playervictoryscene")
        }
        directorOwner.playAgain()
    }
    func backToTitle(){
        guard let directorOwner = owner as? Director else{
            fatalError("need director as owner in playervictoryscene")
        }
        directorOwner.backToTitle()
    }
}
