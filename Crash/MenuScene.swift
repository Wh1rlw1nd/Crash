//
//  MenuScene.swift
//  Crash
//
//  Created by Vladimir Jovicevic on 3/30/16.
//  Copyright © 2016 Vladimir Jovicevic. All rights reserved.
//

import SpriteKit

class MenuScene:SKScene {
    
    override func didMoveToView(view: SKView) { backgroundColor = .orangeColor() }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let nextScene = GameScene(fileNamed: "GameScene"){
            nextScene.scaleMode = .AspectFill
            nextScene.size = CGSize(width: 375, height: 667)
            let transition = SKTransition.fadeWithDuration(1)
            view?.presentScene(nextScene, transition: transition)
        }
    }
    
    deinit {print("MenuScene deinited")}
}

