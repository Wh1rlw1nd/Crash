//
//  GameScene.swift
//  Crash
//
//  Created by Vladimir Jovicevic on 3/30/16.
//  Copyright (c) 2016 Vladimir Jovicevic. All rights reserved.
//

import SpriteKit

class SomeClass{
    
    //As you can guess, I will use this shady property to make a strong cycle :)
    var closure:(()->())?
    init(){}
    func method(){}
    deinit {print("SomeClass deinited")}
}

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = .blackColor()
        
        let someInstance = SomeClass()
        
        let closure = {[unowned self] in
            
            someInstance.method() //This causes the strong reference cycle...
            self.method()
        }
        someInstance.closure = closure
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let nextScene = MenuScene(fileNamed: "MenuScene"){
            nextScene.scaleMode = .AspectFill
            let transition = SKTransition.fadeWithDuration(1)
            view?.presentScene(nextScene, transition: transition)
        }
    }
    
    deinit {print("GameScene deinited")}
    
    func method(){}
}
