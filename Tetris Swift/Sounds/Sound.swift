//
//  Sound.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/12/04.
//

import Foundation
import AVKit

class Sound {
    //MARK:Properties
    var bgm:AVAudioPlayer!
    var buttonSound:AVAudioPlayer!
    
    //MARK:Initialization
    init() {
        if let url = Bundle.main.path(forResource: "bg_sound", ofType: "mp3") {
            do {
                bgm = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            }catch {
                print("DEBUG:Failed load url of sound")
            }
            bgm.volume = 0.5
            //무한반복
            bgm.numberOfLoops = -1
            bgm.play()
        }
    }
    
    func buttonSounds(buttonName:String) {
        if let url = Bundle.main.path(forResource: buttonName, ofType: "mp3") {
            do {
                buttonSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            }catch {
                print("DEBUG:Failed load url of sound")
            }
            buttonSound.volume = 1
            //반복없이 하려면 0으로 해줘야함
            buttonSound.numberOfLoops = 0
            buttonSound.play()
        }
    }
    
    func stop() {
        bgm.pause()
    }
    
    func play() {
        bgm.play()
    }
}
