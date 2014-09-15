//
//  Border.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

enum WallType: Int, Printable {
    
    case North = 1,
         East  = 2,
         South = 4,
         West  = 8
    
    static let allValues: [WallType] = [.North, .East, .South, .West]
    
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

class Wall: Printable {
    
    var column: Int
    var row: Int
    let walls: [WallType]

    
    init(column: Int, row: Int, walls: [WallType]) {
        self.column = column
        self.row = row
        self.walls = walls
    }
    
    var description: String {
        return ""//"Border at \(column), \(row) facing \(orientation.orientationName)"
    }
    
}