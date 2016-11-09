//
//  Map-Drawing.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/17/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

extension Map {
    
    class func drawLocalMap() {
        for row in 0...localMapHeight {
            for column in 0...localMapWidth {
                
                let mapNode = localMap[row][column]
                let char = mapNode.groundType.character
                mvaddch(Int32(row), Int32(column), char)
            }
        }
    }
    
    class func drawLocalMapAroundPlayer() {
        let playerPosition = Player.sharedInstance.position
        
        let horizontalOffset = localMapWidth  / 2
        let verticalOffset   = localMapHeight / 2
        
        let startingHorizontalPosition = playerPosition.x - horizontalOffset
        let startingVerticalPosition = playerPosition.y - verticalOffset
        
        let endingHorizontalPosition = playerPosition.x + horizontalOffset
        let endingVerticalPosition = playerPosition.y + verticalOffset
        
        var screenRow = 0
        for row in startingVerticalPosition...endingVerticalPosition {
            
            var screenColumn = 0
            for column in startingHorizontalPosition...endingHorizontalPosition {
                
                let newPosition = Position(x: column, y: row)
                if Map.localMapPositionExists(newPosition) {
                    
                    let mapNode = localMap[row][column]
                    let char = mapNode.groundType.character
                    mvaddch(Int32(screenRow), Int32(screenColumn), char)
                }
                screenColumn = screenColumn + 1
            }
            
            screenRow = screenRow + 1
        }
    }
    
}