//
//  RightButton.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/01.
//

import Foundation
import SpriteKit

class RightButton {
    
    let btn = SKSpriteNode()
    
    //MARK: Initialization
    init() {
        btn.texture = SKTexture(imageNamed: "right_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "right"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width - 50), y: -Int(Variables.scene.frame.height - 20))
        Variables.scene.addChild(btn)
    }
    
    //MARK: Actions
    func brickMoveRight() {
        if isMovable() {
            rightButtonAnimation()
            var action = SKAction()
            Variables.dx += 1
            for (index,item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                Variables.backArrays[y][x-1] -= 1
                Variables.backArrays[y][x] += 1
                action = SKAction.moveBy(x: CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[index].run(action)
            }
        }
    }
    
    //MARK:Helpers
    
    //움직일 수 있는지 판단하는 함수
    func isMovable() -> Bool {
        
        //블록 중 가장 좌측에 있는 x값 찾아내기
        let right = Variables.brickArrays.sorted { $0.x > $1.x}.first?.x

        //가장 좌측에 있는 값 바로 왼쪽에 있는 x값
        let xValue = Int(right ?? 0) + Variables.dx + 1
        return Variables.backArrays[Variables.dy][xValue] != 0 ? false : true
    }
    
    //왼쪽 버튼 눌렀을 때 애니메이션
    func rightButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "right_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
}
