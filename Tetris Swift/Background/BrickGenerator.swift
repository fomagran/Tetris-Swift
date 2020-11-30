//
//  BrickGenerator.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import Foundation
import SpriteKit

class BrickGenerator {
    let brickValue = Variables.brickValue
    init() {
        let brick = brickValue.points
        for item in brick {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backArrays[y][x] = 1
            
            let xValue = x * brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * brickValue.brickSize + Int(Variables.startPoint.y)
            let brick = SKSpriteNode()
            brick.color = brickValue.color
            brick.size = CGSize(width: brickValue.brickSize - 1, height: brickValue.brickSize - 1)
            brick.name = brickValue.brickName
            brick.zPosition = brickValue.zPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(brick)
            
        }
    }
}
