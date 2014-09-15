//
//  Level.swift
//  RatRiot
//
//  Created by Seth Tenembaum on 9/7/14.
//  Copyright (c) 2014 Serious Thought. All rights reserved.
//

import Foundation

let NumColumns = 12
let NumRows = 10

class Level {
    
    let grid  = Array2D<GridObject>(columns: NumColumns, rows: NumRows)
    let walls = Array2D<Wall>(columns: NumColumns+1, rows: NumRows+1)
    //borders is one larger than the grid and offset by one
    let gridJSON = Array2D<Int>(columns: NumColumns, rows: NumRows)
    let wallsJSON = Array2D<Int>(columns: NumColumns+1, rows: NumRows+1)
    
    func addRat() {
        for column in 0..<NumColumns {
            for row in 0..<NumRows {
                if gridJSON[column, row] == 1 {
                    let rat = Rat(column: column, row: row, orientation: RatOrientation.Up)
                    grid[column, row] = rat
                }
            }
        }
    }
    
    func addWalls() {
        for column in 0..<NumColumns + 1 {
            for row in 0..<NumRows + 1 {
//                if bordersJSON[column, row] != 0  {
//      
//                    let border = Border(column: column, row: row, walls: Walls.fromRaw(bordersJSON[column, row]!)!)
//                    borders[column, row] = border
//                }
            }
        }
    }
    
    func gridObjectAtColumn(column: Int, row: Int) -> GridObject? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return grid[column, row]
    }
    
    init(filename: String) {
        
        let path = NSBundle(forClass: Level.self).pathForResource("Level_0", ofType: "json")
        let string = NSString.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error: nil)
        let json = JSON.parse(string)
        
        if let level = json.value {
            if let grid = level["grid"].array {
//                println(grid)
            }
            if let walls = level["walls"].array {
                println("a \(walls[0][0])")
                for row in walls {
                    println("b \(row[0])")
//                    for col in 0..<row.length {
//                        println(cell)
//                    }
                    var index = 0;
                    while row[index]>=1 {
                        println(row[index])
                        index++
                    }
                }
//                for row in walls as JSValue.JSArrayType {
//                    let myRow: JSValue.JSBackingValue = .JSArray([row])
//                    
//                    println(myRow)
//                    
////                    for cell in row {
////                        println(cell)
////                    }
//                }
                //merge addWalls() here
            }
        }
        
    }
    
}