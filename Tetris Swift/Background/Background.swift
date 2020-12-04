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
        //벽 컨피겨하기전에 백그라운드를 넣어줘야 벽을 안덮게됨
        backGroundColorSetting()
        configureWall()
      
    }
    
    //MARK:Helpers
    
    //백그라운드 배경색 설정해주기
    func backGroundColorSetting() {
        let bg = SKSpriteNode()
        bg.color = .black
        bg.size = Variables.scene.frame.size
        bg.position = CGPoint(x: 0, y: 0)
        bg.anchorPoint = CGPoint(x: 0, y: 1)
        Variables.scene.addChild(bg)
    }
    //벽 만들어주기
    func configureWall() {
        for i in 0..<row {
            Variables.backArrays[col-1][i] = 2
        }
        for i in 0..<col-1 {
            Variables.backArrays[i][0] = 2
        }
        for i in 0..<col-1 {
            Variables.backArrays[i][row-1] = 2
        }
        for i in 0..<row {
            Variables.backArrays[0][i] = 2
        }
        lines()
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
    
    //얇은 선 만들어주기
    func lines() {
        let leftX = Int(Variables.startPoint.x) + (Variables.brickValue.brickSize/2)
        let rightX = Variables.brickValue.brickSize * (row-2) + leftX
        let topY = Int(Variables.startPoint.y) + (Variables.brickValue.brickSize/2)
        let bottomY = Variables.brickValue.brickSize * (col-1) + topY
        
        let leftLine = SKSpriteNode()
        leftLine.color = .darkGray
        leftLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        leftLine.size = CGSize(width: 1, height: Variables.brickValue.brickSize * (col - 1))
        leftLine.position = CGPoint(x: leftX, y: -topY)
        Variables.scene.addChild(leftLine)
        
        let rightLine = SKSpriteNode()
        rightLine.color = .darkGray
        rightLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        rightLine.size = CGSize(width: 1, height: Variables.brickValue.brickSize * (col - 1))
        rightLine.position = CGPoint(x: rightX, y: -topY)
        Variables.scene.addChild(rightLine)
        
        let bottomLine = SKSpriteNode()
        bottomLine.color = .darkGray
        bottomLine.anchorPoint = CGPoint(x: 0, y: 0.5)
        bottomLine.size = CGSize(width: rightX-leftX, height: 1)
        bottomLine.position = CGPoint(x: leftX, y: -bottomY)
        Variables.scene.addChild(bottomLine)
        
        let topLine = SKSpriteNode()
        topLine.color = .darkGray
        topLine.anchorPoint = CGPoint(x: 0, y: 0.5)
        topLine.size = CGSize(width: rightX-leftX, height: 1)
        topLine.position = CGPoint(x: leftX, y: -topY)
        Variables.scene.addChild(topLine)
    }
}
