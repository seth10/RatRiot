//
//  GridObject.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

class GridObject {
    
    var column: Int
    var row: Int
    var spriteName: String?
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int){
        self.column = column
        self.row = row
    }
    
}