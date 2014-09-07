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
    
    let grid    = Array2D<GridObject>(columns: NumColumns, rows: NumRows)
    let borders = Array2D<Border>(columns: NumColumns+1, rows: NumRows+1)
    //borders is one larger than the grid and offset by one
    let gridJSON = Array2D<Int>(columns: NumColumns, rows: NumRows)
    let bordersJSON = Array2D<Int>(columns: NumColumns+1, rows: NumRows+1)
    
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
    
    func addBorders() {
        for column in 0..<NumColumns+1 {
            for row in 0..<NumRows+1 {
                if bordersJSON[column, row] != 0  {
                    let border = Border(column: column, row: row, orientation: ( bordersJSON[column, row]==1 ? BorderOrientation.Horizontal : BorderOrientation.Vertical ))
                    borders[column, row] = border
                }
            }
        }
    }
    
    func gridObjectAtColumn(column: Int, row: Int) -> GridObject? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return grid[column, row]
    }
    
    init(filename: String) {
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            if let gridArray: AnyObject = dictionary["grid"] {
                for (row, rowArray) in enumerate(gridArray as [[Int]]) {
                    let tileRow = NumRows - row - 1
                    for (column, value) in enumerate(rowArray) {
                        gridJSON[column, tileRow] = value
                    }
                }
            }
            if let bordersArray: AnyObject = dictionary["borders"] {
                for (row, rowArray) in enumerate(bordersArray as [[Int]]) {
                    let tileRow = NumRows + 1 - row - 1
                    for (column, value) in enumerate(rowArray) {
                        bordersJSON[column, tileRow] = value
                    }
                }
            }
        }
    }
    
}