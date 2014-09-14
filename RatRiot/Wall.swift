//
//  Border.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

enum Wall: Int, Printable {
    
    case North = 1,
         East  = 2,
         South = 4,
         West  = 8
    
    static let allValues: [Wall] = [.North, .East, .South, .West]
    
    var wallsName: String {
        let wallNames = [ "North",
                          "East",
                          "South",
                          "West" ]
        
        return wallNames[toRaw()]
    }
    
    var description: String {
        
        return wallsName
    }
    
}

class Border: Printable {
    
    var column: Int
    var row: Int
    let walls: [Wall]
    var spriteName: String
    //can I make this a let even though in the protocol its a var?
    var sprite: SKSpriteNode?
    //why a var?
    
    init(column: Int, row: Int, walls: [Wall]) {
        self.column = column
        self.row = row
        self.walls = walls
        self.spriteName = "Border"
    }
    
    var description: String {
        return ""//"Border at \(column), \(row) facing \(orientation.orientationName)"
    }
    
}