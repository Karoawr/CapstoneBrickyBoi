import Scenes

class Director : DirectorBase {
    var upcomingScene : Scene? = nil
    var rightNowScene : Scene? = nil
    var shouldTransition : Bool = false
    var framesPassed = 0
    
    required init() {
        super.init()
        moveToScene(newScene:TitleScene())
    }

    override func framesPerSecond() -> Int{
        return 50
    }
    
    override func nextScene() -> Scene? {
        shouldTransition = false
        rightNowScene = upcomingScene
        return rightNowScene
    }

    override func shouldSceneTerminate() -> Bool{
        return shouldTransition
    }
    
    func moveToScene(newScene:Scene) {
        upcomingScene = newScene
        shouldTransition = true
    }

    func playerWins(){
        guard let currentScene = rightNowScene as? MainScene else {
            fatalError("Player can't win from scene other than MainScene")
        }
        moveToScene(newScene:PlayerVictoryScene())
    }
    
    func playAgain() {
        guard let currentScene = rightNowScene as? PlayerVictoryScene else {
            fatalError("Can't play again from anything other than PlayerVictoryScene")
        }
        moveToScene(newScene:MainScene())
    }

    func playGame() {
        guard let currentScene = rightNowScene as? TitleScene else {
            fatalError("Can't play again from anything other than TitleScene")
        }
        moveToScene(newScene:MainScene())
    }
    
    func backToTitle() {
        guard let currentScene = rightNowScene as? PlayerVictoryScene else {
            fatalError("Can't quitn from anything other than PlayerVictoryScene")
        }
        moveToScene(newScene:TitleScene())
    }
    
    override func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if let currentScene = rightNowScene as? MainScene {
            switch(key){
            case "ArrowLeft":
                currentScene.movePaddle(direction:.left)
            case "ArrowRight":
                currentScene.movePaddle(direction:.right)
            default :
                break
            }
        }
    }
}

