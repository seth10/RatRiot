//
//  Rat.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/6/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

enum RatOrientation: Int, Printable {
    
    case Up = 0, Right, Down, Left
    
    var orientationName: String {
        let orientationNames = [
            "up",
            "right",
            "down",
            "left"]
            
        return orientationNames[toRaw()]
    }
    
    var description: String {
        return orientationName
    }
    
}

class Rat: GridObject, Printable {
    
//    var column: Int
//    var row: Int
    let orientation: RatOrientation
//    var spriteName = "Rat"
    //can I make this a let even though in the protocol its a var?
//    var sprite: SKSpriteNode?
    //why a var?
    
    init(column: Int, row: Int, orientation: RatOrientation) {
//        self.column = column
//        self.row = row
        self.orientation = orientation
        super.init(column: column, row: row)
        spriteName = "Rat"
    }
    
    var description: String {
        return "Rat at \(column), \(row) facing \(orientation.orientationName)"
    }
    
}