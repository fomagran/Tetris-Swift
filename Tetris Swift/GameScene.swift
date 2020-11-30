//
//  GameScene.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        Variables.scene = self
        let bg = BackGround()
        let generator = BrickGenerator()
        
    }
}
