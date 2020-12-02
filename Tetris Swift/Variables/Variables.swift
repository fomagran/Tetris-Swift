//
//  Variables.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//

import Foundation
import SpriteKit

struct Variables {
    static var backArrays = [[Int]]()
    static var scene = SKScene()
    //클래스 안에 함수 이용하려면 class에 ()를 붙여줘야함.
    static var brickValue = RandomBrick().randomBrick()
    static var dx = 4
    static var dy = 2
    static var startPoint = CGPoint()
    static var brickArrays = Array<CGPoint>()
    static var brickNode = Array<SKSpriteNode>()
    static var blockedArrays = Array<SKSpriteNode>()
}
