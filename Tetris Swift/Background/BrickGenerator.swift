//
//  BrickGenerator.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import Foundation
import SpriteKit

class BrickGenerator {

    init() {
        Variables.dx = 4
        Variables.dy = 2
        Variables.brickValue = Variables.newBrickArray[0]
        let brickValue = Variables.brickValue
        let brick = brickValue.points
        Variables.brickArrays = brick
        Variables.brickNode.removeAll()
        for item in brick {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backArrays[y][x] = 1
            
            let xValue = x * brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * brickValue.brickSize + Int(Variables.startPoint.y)
            let brick = SKSpriteNode()
            brick.color = brickValue.color
            //블록 디자인 바꾸기
            brick.texture = SKTexture(imageNamed: brickValue.brickName)
            brick.size = CGSize(width: brickValue.brickSize - 1, height: brickValue.brickSize - 1)
            //블록 사이즈 바꿔주기 (사이즈 아래에다 넣어줘야함)
            brick.setScale(2.7)
            //배경화면 빛에 따라 쉐도우 주는것
//            brick.shadowedBitMask = 0b001
            //배경화면에 조명주는것
            brick.lightingBitMask = 0b0001
            brick.name = brickValue.brickName
            brick.zPosition = brickValue.zPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(brick)
            Variables.brickNode.append(brick)
        }
    }
}
