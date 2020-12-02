//
//  LeftButton.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/01.
//

import Foundation
import SpriteKit

class LeftButton {
    
    let btn = SKSpriteNode()
    
    //MARK: Initialization
    init() {
        btn.texture = SKTexture(imageNamed: "left_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "left"
        btn.zPosition = 1
        btn.position = CGPoint(x: 50, y: -Int(Variables.scene.frame.height - 20))
        Variables.scene.addChild(btn)
    }
    
    //MARK: Actions
    func brickMoveLeft() {
        
        if isMovable() {
            leftButtonAnimation()
            var action = SKAction()
            Variables.dx -= 1
            for (index,item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                Variables.backArrays[y][x+1] -= 1
                Variables.backArrays[y][x] += 1
                action = SKAction.moveBy(x: -CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[index].run(action)
            }
        }
    }
    
    //MARK:Helpers
    
    //움직일 수 있는지 판단하는 함수
    func isMovable() -> Bool {
        
        //블록의 x바로 옆이 2가 아닌지 확인
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            if Variables.backArrays[y][x-1] == 2 {
               return false
            }
        }
        return true
    }
    
    //왼쪽 버튼 눌렀을 때 애니메이션
    func leftButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "left_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
}
