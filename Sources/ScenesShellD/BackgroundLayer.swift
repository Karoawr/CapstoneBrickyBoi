import Scenes

class BackgroundLayer : Layer{
    let field : Field

    override init(){
        field = Field()

        super.init()

        insert(entity:field, at:.front)
    }
}
