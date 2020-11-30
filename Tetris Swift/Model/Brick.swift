//
//  Brick.swift
//  Tetris Swift
//
//  Created by Fomagran on 2020/11/30.
//
import UIKit

struct Brick {
    var color = UIColor()
    var points = Array<CGPoint>()
    let brickSize = 35
    let zPosition = CGFloat(1)
    var brickName = String()
}
