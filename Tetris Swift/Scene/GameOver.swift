//
//  GameOver.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/03.
//

import Foundation
import SpriteKit

class GameOver:SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location ?? CGPoint(x: 0, y: 0))
        for item in node {
            if item.name == "restart" {
            let scene = GameScene(size:view!.frame.size)
            scene.scaleMode = .aspectFill
            scene.anchorPoint = CGPoint(x: 0, y: 1)
            let transition = SKTransition.moveIn(with: .left, duration: 1)
            view!.presentScene(scene,transition: transition)
            }
        }
    }
}
