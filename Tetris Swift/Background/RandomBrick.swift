//
//  Brick.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import Foundation
import SpriteKit

class RandomBrick {

    func randomBrick() -> Brick {
        
        var bricks = [Brick]()
        
        var brick1 = [CGPoint]()
        brick1.append(CGPoint(x: 0, y: 0))
        brick1.append(CGPoint(x: 1, y: 0))
        brick1.append(CGPoint(x: -1, y: 0))
        brick1.append(CGPoint(x: 0, y: 1))
        bricks.append(Brick(color: .red, points: brick1,brickName: "brick1"))
        
        var brick2 = [CGPoint]()
        brick2.append(CGPoint(x: -1, y: 0))
        brick2.append(CGPoint(x: 0, y: 0))
        brick2.append(CGPoint(x: 1, y: 0))
        brick2.append(CGPoint(x: 2, y: 0))
        bricks.append(Brick(color: .blue, points: brick2,brickName: "brick2"))
        
        var brick3 = [CGPoint]()
        brick3.append(CGPoint(x: 0, y: 0))
        brick3.append(CGPoint(x: 1, y: 0))
        brick3.append(CGPoint(x: 0, y: 1))
        brick3.append(CGPoint(x: -1, y: 1))
        bricks.append(Brick(color: .green, points: brick3,brickName: "brick3"))
        
        var brick4 = [CGPoint]()
        brick4.append(CGPoint(x: -1, y: 1))
        brick4.append(CGPoint(x: -1, y: 0))
        brick4.append(CGPoint(x: 0, y: 1))
        brick4.append(CGPoint(x: 1, y: 0))
        bricks.append(Brick(color: .purple, points: brick4,brickName: "brick4"))
        
        var brick5 = [CGPoint]()
        brick5.append(CGPoint(x: 1, y: 0))
        brick5.append(CGPoint(x: 0, y: 0))
        brick5.append(CGPoint(x: 0, y: 1))
        brick5.append(CGPoint(x: 1, y: 1))
        bricks.append(Brick(color: .systemIndigo, points: brick5,brickName: "brick5"))
        
        var brick6 = [CGPoint]()
        brick6.append(CGPoint(x: 1, y: 1))
        brick6.append(CGPoint(x: -1, y: 0))
        brick6.append(CGPoint(x: 0, y: 0))
        brick6.append(CGPoint(x: 1, y: 0))
        bricks.append(Brick(color: .orange, points: brick6,brickName: "brick6"))
        
        var brick7 = [CGPoint]()
        brick7.append(CGPoint(x: 0, y: 0))
        brick7.append(CGPoint(x: -1, y: 0))
        brick7.append(CGPoint(x: 0, y: 1))
        brick7.append(CGPoint(x: 1, y: 1))
        bricks.append(Brick(color: .yellow, points: brick7,brickName: "brick7"))
        
        let random = Int.random(in: 0...6)
        
        return bricks[random]
    }
}
