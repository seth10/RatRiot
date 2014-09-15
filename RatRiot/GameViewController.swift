//
//  GameViewController.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/2/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
    }
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        level = Level(filename: "Level_0")
        scene.level = level
        
        // Present the scene.
        skView.presentScene(scene)
        
        beginGame()
        
        scene.tick = ratAction
//        scene.startTicking()
    }
    
    func beginGame() {
        level.addRat()
        scene.addSpritesForGridObjects()
        level.addWalls()
        scene.addSpritesForWalls()
    }
    
    func ratAction() {
        for column in 0..<NumColumns {
            for row in 0..<NumRows {
                if let rat = level.grid[column, row] as? Rat {
                    switch rat.orientation {
                    case .Up:
                        if let nextCell = level.grid[rat.column, rat.row+1] {
                           // if level.bordersp[
                            println("go")
                        }
                    case .Right:
                        println()
                    case .Down:
                        println()
                    case .Left:
                        println()
                    }
                }
            }
        }
        return
    }
    
}