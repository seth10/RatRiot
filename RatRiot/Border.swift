//
//  Border.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import SpriteKit

enum BorderOrientation: Int, Printable {
    
    case Horizontal = 1, Vertical
    
    var orientationName: String {
        let orientationNames = [
            "horizontal",
            "vertical"]
            
        return orientationNames[toRaw()-1]
    }
    
    var orientationSpriteName: String {
        let orientationSpriteNames = [
            "Horizontal",
            "Vertical"]
            
            return orientationSpriteNames[toRaw()-1]
    }
    
    var description: String {
        return orientationName
    }
    
}

class Border: Printable {
    
    var column: Int
    var row: Int
    let orientation: BorderOrientation
    var spriteName: String
    //can I make this a let even though in the protocol its a var?
    var sprite: SKSpriteNode?
    //why a var?
    
    init(column: Int, row: Int, orientation: BorderOrientation) {
        self.column = column
        self.row = row
        self.orientation = orientation
        self.spriteName = "Border\(orientation.orientationSpriteName)"
    }
    
    var description: String {
        return "Border at \(column), \(row) facing \(orientation.orientationName)"
    }
    
}