//
//  StopButton.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/03.
//

import Foundation
import SpriteKit

class StopButton {
    
    let btn = SKSpriteNode()
    
    //MARK: Initialization
    init() {
        btn.texture = SKTexture(imageNamed: "stop_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "stop"
        let point1 = Int(Variables.scene.frame.width)/2
        let point2 = Int(Variables.scene.frame.width) -  50
        let xValue = point1 + (point2 - point1)/2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height - 20))
        Variables.scene.addChild(btn)
    }
    
    //벽돌 내려오는거 멈추게 하는 함수
    func brickStop() {
        if Variables.isPause {
            reverseStopButtonAnimation()
            Variables.isPause = false
        }else{
            stopButtonAnimation()
            Variables.isPause = true
        }
    }
    
    //스톱상태에서 다시 돌아갈 때 애니메이션
    func reverseStopButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in stride(from: 15, through: 1, by: -1){
            let name = "stop_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
            let action = SKAction.animate(with: textures, timePerFrame: 0.03)
            btn.run(action)
        }
    }
    
    //스톱 버튼 눌렀을 때 애니메이션
    func stopButtonAnimation() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "stop_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }

}
