//
//  GameScene.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/2/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var level: Level!
    
    let TileWidth:  CGFloat = 32.0
    let TileHeight: CGFloat = 32.0
    
    let gameLayer   = SKNode()
    let gridLayer   = SKNode()
    let borderLayer = SKNode()

    var tick:(() -> ())?
    var tickLengthMillis = NSTimeInterval(1000)
    var lastTick:NSDate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        setup()
    }
    
    func setup() {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        addChild(background)
        
        addChild(gameLayer)
        
//        let layerPosition = CGPoint(
//            x: -TileWidth  * CGFloat(NumColumns) / 2,
//            y: -TileHeight * CGFloat(NumRows)    / 2)
        let gridPosition = CGPoint(
            x: -284,
            y: -160)
        
        gridLayer.position = gridPosition
        gameLayer.addChild(gridLayer)
        
        
//        let layerPosition = CGPoint(
//            x: -TileWidth  * CGFloat(NumColumns) / 2,
//            y: -TileHeight * CGFloat(NumRows)    / 2)
        let borderPosition = CGPoint(
            x: -300,
            y: -176)
        
        borderLayer.position = borderPosition
        gameLayer.addChild(borderLayer)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastTick == nil {
            return
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = NSDate.date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
    
    func addSpritesForGridObjects() {
        for column in 0..<NumColumns {
            for row in 0..<NumRows {
                if let gridObject = level.grid[column, row] {
                    let sprite = SKSpriteNode(imageNamed: gridObject.spriteName)
                    sprite.position = pointForColumn(column, row:row)
                    gridLayer.addChild(sprite)
                    gridObject.sprite = sprite
                }
            }
        }
    }
    
    func addSpritesForBorders() {
        for column in 0..<NumColumns+1 {
            for row in 0..<NumRows+1 {
                if let border = level.borders[column, row] {
                    let sprite = SKSpriteNode(imageNamed: border.spriteName)
                    sprite.position = pointForColumn(column, row:row)
                    borderLayer.addChild(sprite)
                    border.sprite = sprite
                }
            }
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
}