//
//  GameScene.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: Properties
    var leftBtn:LeftButton?
    var rightBtn:RightButton?
    var rotationBtn:RotationButton?
    var downBtn : DownButton?
    var stopBtn:StopButton?
    var updateTime = 0.0
    var sound : Sound?

    //MARK:Life Cycle
    override func didMove(to view: SKView) {
        configure()
    }
    
    
    //MARK: Helpers
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
    
    func configure() {
        Variables.scene = self
        _ = BackGround()
        NextBrick().addBrick()
        _ = BrickGenerator()
        
        leftBtn = LeftButton()
        rightBtn = RightButton()
        rotationBtn = RotationButton()
        downBtn = DownButton()
        stopBtn = StopButton()
        sound = Sound()
    }
    
    //MARK:Actions
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location ?? CGPoint(x: 0, y: 0))
        for item in node {
            if item.name == "left" {
                leftBtn?.brickMoveLeft()
                //사운드 삽입
                sound?.buttonSounds(buttonName: "move")
            }else if item.name == "right" {
                rightBtn?.brickMoveRight()
                sound?.buttonSounds(buttonName: "move")
            }else if item.name == "rotation" {
                rotationBtn?.brickRotation()
                sound?.buttonSounds(buttonName: "rotation")
            }else if item.name == "down"{
                sound?.buttonSounds(buttonName: "down")
                //블록 내리기 누르면 한방에 내려가게 하기
                while (downBtn?.isDownable())! {
                    downBtn?.brickDown()
                }
              
            }else if item.name == "stop" {
                stopBtn?.brickStop()
                //정지버튼에 맞춰서 사운드 멈추고 플레이하기
                if !Variables.isPause {
                    sound?.play()
                }else{
                    sound?.stop()
                }
            }
        }
    }
    
}
