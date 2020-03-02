import Scenes

class TransitionLayer : Layer{
    let waityBoi : WaityBoi

    override init(){
        print("Creating TransitionLayer...")
        waityBoi = WaityBoi()
        super.init()
        insert(entity:waityBoi, at:.front)
    }
}
