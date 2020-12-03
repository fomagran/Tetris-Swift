//
//  RotationButton.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/02.
//

import Foundation
import SpriteKit

class RotationButton {
    
    let btn = SKSpriteNode()
    
    //MARK: Initialization
    init() {
        btn.texture = SKTexture(imageNamed: "rotaion_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "rotation"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width)/2, y: -Int(Variables.scene.frame.height - 20))
        Variables.scene.addChild(btn)
    }
    //MARK: Actions
    //로테이션 시키는 함수
    func brickRotation() {
        if isRotatable() {
            rotationButtonAnimation()
            let sinX = CGFloat(1)
            let cosX = CGFloat(0)
            var rotatedBrick = Array<CGPoint>()
            var action = SKAction()
            for (index,item) in Variables.brickArrays.enumerated() {
                let row = item.y
                let col = item.x
                let currentX = Int(item.x) + Variables.dx
                let currentY = Int(item.y) + Variables.dy
                Variables.backArrays[currentY][currentX] -= 1
                //x,y좌표를 회전시키는 공식
                let newBrickX = (col*cosX) - (row*sinX)
                let newBrickY = (col*sinX) + (row*cosX)
                rotatedBrick.append(CGPoint(x: newBrickX, y: newBrickY))
                
                let newX = Int(newBrickX) + Variables.dx
                let newY = Int(newBrickY) + Variables.dy
                Variables.backArrays[newY][newX] += 1
                
                let xValue = Int(newX) * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
                let yValue = Int(newY) * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
                action = SKAction.move(to: CGPoint(x: xValue, y: -yValue), duration: 0.1)
                Variables.brickNode[index].run(action)
            }
            Variables.brickArrays = rotatedBrick
             
        }
    }
    //MARK: Helpers
    //위,왼쪽,오른쪽 확인해서 회전이 가능한지
    func isRotatable() -> Bool {
        //정사각형 모양 블록일 땐 회전 불가능하게 바꿈.
        if Variables.brickValue.brickName == "brick5" {
            return false
        }
        let sinX = CGFloat(1)
        let cosX = CGFloat(0)
        for item in Variables.brickArrays {
            if item.x != 0 || item.y != 0 {
                let row = item.y
                let col = item.x
                let x = Int((col*cosX) - (row*sinX)) + Variables.dx
                let y = Int((col*sinX) + (row*cosX)) + Variables.dy
                //2로 설정한 이유는 뻐큐모양 블록이 회전할 때에 부합하지 않아서 벽을 2로 바꿨다.
                if Variables.backArrays[y][x] == 2{
                    return false
                }
            }
        }
        return true
    }
    
    //로테이션 버튼 눌렀을 때 애니메이션
    func rotationButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "rotaion_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
}
