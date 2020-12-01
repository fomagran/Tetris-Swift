//
//  GameScene.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftBtn:LeftButton?
    var rightBtn:RightButton?

    override func didMove(to view: SKView) {
        
        Variables.scene = self
        let bg = BackGround()
        let generator = BrickGenerator()
        
        leftBtn = LeftButton()
        rightBtn = RightButton()
    }

    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location ?? CGPoint(x: 0, y: 0))
        for item in node {
            if item.name == "left" {
                leftBtn?.brickMoveLeft()
            }else if item.name == "right" {
                rightBtn?.brickMoveRight()
            }
        }
    }
}
