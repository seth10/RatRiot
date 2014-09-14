//
//  GridObject.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

//protocol GridObject {
//    
//    //must have a column and row?
//    var spriteName: String { get }
//    //want this to be a let
//    var sprite: SKSpriteNode? { get set }
//    
//}

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