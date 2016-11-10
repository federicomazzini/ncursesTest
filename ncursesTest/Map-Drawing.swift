//
//  Map-Drawing.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/17/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

extension Map {
    
    class func drawMemoryMap() {
        for row in 0...visibleMapHeight {
            for column in 0...visibleMapWidth {
                
                let mapNode = memoryMap[row][column]
                let char = mapNode.groundType.character
                mvaddch(Int32(row), Int32(column), char)
            }
        }
    }
    
    class func drawMemoryMapAroundPlayer() {
        let playerPosition = Player.sharedInstance.position
        
        let horizontalOffset = visibleMapWidth  / 2
        let verticalOffset   = visibleMapHeight / 2
        
        let startingHorizontalPosition = playerPosition.x - horizontalOffset
        let startingVerticalPosition = playerPosition.y - verticalOffset
        
        let endingHorizontalPosition = playerPosition.x + horizontalOffset
        let endingVerticalPosition = playerPosition.y + verticalOffset
        
        var screenRow = 0
        for row in startingVerticalPosition...endingVerticalPosition {
            
            var screenColumn = 0
            for column in startingHorizontalPosition...endingHorizontalPosition {
                
                let newPosition = Position(x: column, y: row)
                if Map.memoryMapPositionExists(newPosition) {
                    
                    let mapNode = memoryMap[row][column]
                    let char = mapNode.groundType.character
                    mvaddch(Int32(screenRow), Int32(screenColumn), char)
                } else {
                    mvaddch(Int32(screenRow), Int32(screenColumn), UInt32(" "))
                }
                screenColumn = screenColumn + 1
            }
            
            screenRow = screenRow + 1
        }
    }
    
}