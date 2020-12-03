//
//  DownButton.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/02.
//

import Foundation
import SpriteKit

class DownButton {
    
    let btn = SKSpriteNode()
    
    //MARK: Initialization
    init() {
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        let point1 = 50
        let point2 = Int(Variables.scene.frame.width)/2
        let xValue = point1 + (point2 - point1)/2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height - 20))
        Variables.scene.addChild(btn)
    }
    //MARK: Actions
    //블록 내리는 함수
    func brickDown() {
        if isDownable() {
            downButtonAnimation()
            downButtonAnimation()
            possibleDown()
        }else{
            impossibleDown()
        }
    }
    //MARK: Helpers
    //밑으로 내릴 수 있는지 확인
    func isDownable() -> Bool {
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            if Variables.backArrays[y+1][x] == 2 {
                return false
            }
        }
        return true
    }
    
    //블록이 내려올수 있을때
    func possibleDown() {
        Variables.dy += 1
        var action = SKAction()
        for (index,item) in Variables.brickArrays.enumerated() {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            Variables.backArrays[y-1][x] -= 1
            Variables.backArrays[y][x] += 1
            action = SKAction.moveBy(x:0,y: -CGFloat(Variables.brickValue.brickSize), duration: 0.1)
            Variables.brickNode[index].run(action)
        }
    }
    //블록이 내려올수 없을때
    func impossibleDown(){
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            //아래로 다 내려온 것들은 벽으로 만들어버림 (2로 변경)
            Variables.backArrays[y][x] = 2
            //다 내려온 블럭은 따로 blockedArrays에 모아줌
            let blocked = SKSpriteNode()
            blocked.color = .gray
            blocked.size = CGSize(width: Variables.brickValue.brickSize - 1, height: Variables.brickValue.brickSize - 1)
            blocked.name = "blocked"
            let xValue = x*Variables.brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y*Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            blocked.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(blocked)
            Variables.blockedArrays.append(blocked)
        }
        //기존에 있는 블럭을 삭제
        for item in Variables.brickNode {
            item.removeFromParent()
        }
        checkDelete()
    }
    
    //블록 삭제
    func checkDelete() {
        //블럭에서 중복된 y값을 제거
        var set = Set<Int>()
        for item in Variables.brickArrays {
            let y = Int(item.y) + Variables.dy
            set.insert(y)
        }
        for y in set.sorted() {
            //가져온 y행에서 0값이 있는지 확인
            if !Variables.backArrays[y].contains(0) {
                Variables.backArrays.remove(at: y)
                Variables.backArrays.insert([2,0,0,0,0,0,0,0,0,2], at: 1)
                
                let yValue = y*Variables.brickValue.brickSize + Int(Variables.startPoint.y)
                for item in Variables.blockedArrays {
                    //같은 라인에 있는 벽이된 블록들을 삭제
                    if Int(item.position.y) == -yValue {
                        if let removeItem = Variables.blockedArrays.firstIndex(of: item) {
                            Variables.blockedArrays.remove(at: removeItem)
                            var action = SKAction()
                            action = SKAction.fadeOut(withDuration: 0.1)
                            item.run(action) {
                                item.removeFromParent()
                            }
                        }
                    }
                    //삭제되는 라인보다 위에있는 라인들은 밑으로 내려야함
                    if Int(item.position.y) > -yValue {
                        var action = SKAction()
                        action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.5)
                        item.run(action)
                    }
                }
            }
            
        }
        if isGameOver(deadLine: Variables.dy) {
        //블록 새로 생성
        _ = BrickGenerator()
        }
    }
    
    //다운 버튼 눌렀을 때 애니메이션
    func downButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func isGameOver(deadLine:Int) -> Bool {
        if deadLine > 2 {
            return true
        }else {
            if let scene = GameOver(fileNamed: "GameOver") {
                let transition = SKTransition.moveIn(with: .right, duration: 1)
                Variables.scene.view?.presentScene(scene,transition: transition)
            }
            return false
        }
    }
}
