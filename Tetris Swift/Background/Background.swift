//
//  Background.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import Foundation
import SpriteKit

class BackGround {
    //MARK: Properties
    var arrays = [[Int]]()
    let row = 10
    let col = 20
    let brickSize = Variables.brickValue.brickSize
    let scene = Variables.scene
    //MARK:Initialization
    init(){
        Variables.backArrays = Array(repeating: Array(repeating: 0, count: row), count: col)
        let xValue = ((Int(scene.frame.width) - row * brickSize) + brickSize)/2
        Variables.startPoint = CGPoint(x:xValue , y: 100)
        configureWall()
        
    }
    
    //MARK:Helpers
    
    //벽 만들어주기
    func configureWall() {
        for i in 0..<row {
            Variables.backArrays[col-1][i] = 1
            Variables.scene.addChild(setWall(x: i, y: col-1))
        }
        for i in 0..<col-1 {
            Variables.backArrays[i][0] = 1
            Variables.scene.addChild(setWall(x: 0, y: i))
        }
        for i in 0..<col-1 {
            Variables.backArrays[i][row-1] = 1
            Variables.scene.addChild(setWall(x: row-1, y: i))
        }
        for i in 0..<row {
            Variables.backArrays[0][i] = 1
            Variables.scene.addChild(setWall(x: i, y: 0))
        }
    }
    
    func setWall(x:Int,y:Int) -> SKSpriteNode {
        let brick = SKSpriteNode()
        brick.size = CGSize(width: brickSize - 1, height: brickSize - 1)
        brick.color = .gray
        brick.name = "wall"
        brick.zPosition = 1
        let xValue = x*brickSize + Int(Variables.startPoint.x)
        let yValue = y*brickSize + Int(Variables.startPoint.y)
        brick.position = CGPoint(x: xValue, y: -yValue)
        
        return brick
    }
}
