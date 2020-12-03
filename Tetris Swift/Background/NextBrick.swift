//
//  NextBrick.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/03.
//

import Foundation
import SpriteKit

class NextBrick {
    
    func addBrick() {
        Variables.nodeGroup.removeAll()
        Variables.newBrickArray.removeAll()
        var xValue = 0
        for _ in 0..<10 {
            xValue += 100
            brickGenerator(brickSpace: CGFloat(xValue))
        }
        Variables.nodeGroup.remove(at: 0)
        for brick in Variables.nodeGroup {
            for item in brick {
                Variables.scene.addChild(item)
            }
        }
    }
    
    func brickGenerator(brickSpace:CGFloat) {
        let yPosition = CGFloat(50)
        let blockValue = RandomBrick().randomBrick()
        var nextBrickArrays = Array<SKSpriteNode>()
        for item in blockValue.points {
            let brick  = SKSpriteNode()
            let x = item.x
            let y = item.y
            brick.size = CGSize(width: CGFloat(blockValue.brickSize/2) - 1, height: CGFloat(blockValue.brickSize/2) - 1)
            brick.color = blockValue.color
            brick.name = "nextBrick"
            let xValue = x*CGFloat(blockValue.brickSize/2) + brickSpace - 150
            let yValue = y*CGFloat(blockValue.brickSize/2) + yPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            nextBrickArrays.append(brick)
        }
        Variables.nodeGroup.append(nextBrickArrays)
        Variables.newBrickArray.append(blockValue)
    }
    
    func nextBrickMoveLeft() {
        //배열 첫번째 요소 삭제
        Variables.newBrickArray.remove(at: 0)
        for item in Variables.nodeGroup.first! {
            item.removeFromParent()
        }
        Variables.nodeGroup.remove(at: 0)
        //왼쪽으로 이동
        let action = SKAction.moveBy(x: -100, y: 0, duration: 1)
        for brick in Variables.nodeGroup {
            for item in brick {
                item.run(action)
            }
        }
        //마지막 블럭 생성 각 블록당 스페이스가 100이고 10개이므로 1000을 줌
        brickGenerator(brickSpace: 1000)
        for item in Variables.nodeGroup.last! {
            Variables.scene.addChild(item)
        }
    }
}
