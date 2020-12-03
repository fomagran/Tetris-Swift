//
//  GameScene.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftBtn:LeftButton?
    var rightBtn:RightButton?
    var rotationBtn:RotationButton?
    var downBtn : DownButton?
    var stopBtn:StopButton?
    var updateTime = 0.0

    override func didMove(to view: SKView) {
        
        Variables.scene = self
        _ = BackGround()
        NextBrick().addBrick()
        _ = BrickGenerator()
        
        leftBtn = LeftButton()
        rightBtn = RightButton()
        rotationBtn = RotationButton()
        downBtn = DownButton()
        stopBtn = StopButton()
    }
    
    //1초 단위로 블록 내리기
    override func update(_ currentTime: TimeInterval) {
        if updateTime == 0 {
                updateTime = currentTime
            }
        if currentTime - updateTime > 1 {
            updateTime = currentTime
            if !Variables.isPause {
            downBtn?.brickDown()
            }
        }
    }
    

    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location ?? CGPoint(x: 0, y: 0))
        for item in node {
            if item.name == "left" {
                leftBtn?.brickMoveLeft()
            }else if item.name == "right" {
                rightBtn?.brickMoveRight()
            }else if item.name == "rotation" {
                rotationBtn?.brickRotation()
            }else if item.name == "down"{
                //블록 내리기 누르면 한방에 내려가게 하기
                while (downBtn?.isDownable())! {
                    downBtn?.brickDown()
                }
            }else if item.name == "stop" {
                stopBtn?.brickStop()
            }
        }
    }
}
