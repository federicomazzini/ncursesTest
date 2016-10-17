//
//  ControlsManager.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/7/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

class ControlsManager {
    static let sharedInstance = ControlsManager()
    
    func processInput(ch : UInt32, player: Actor) -> Bool {
        
        var string = ""
        string.append(Character(UnicodeScalar(ch)))
        
        // Check if the user wishes to play the game
        if string == "q" {
            return false
        }
        
        if ch == UInt32(KEY_LEFT) ||
            ch == UInt32(KEY_RIGHT) ||
            ch == UInt32(KEY_UP) ||
            ch == UInt32(KEY_DOWN) {
            
            var newPosition : Position!
            
            switch ch {
                case UInt32(KEY_LEFT):
                    newPosition = Position(x: player.position.x - 1, y: player.position.y)
                case UInt32(KEY_RIGHT):
                    newPosition = Position(x: player.position.x + 1, y: player.position.y)
                case UInt32(KEY_UP):
                    newPosition = Position(x: player.position.x, y: player.position.y - 1)
                case UInt32(KEY_DOWN):
                    newPosition = Position(x: player.position.x, y: player.position.y + 1)
                default:
                    break
            }
            
            if Map.localMapPositionExists(newPosition) {
                if Map.localMap[newPosition.y][newPosition.x].isPassable() {
                    player.position = newPosition
                }
            }
        }
        
        mvaddch(Int32(player.position.y), Int32(player.position.x), UInt32("@"))
        
        return true
    }
    
    func printPlayerPosition(player: Actor) {
        
        let posX = String(player.position.x)
        let posY = String(player.position.y)
        move(16, 0)
        addstr("Player position")
        
        move(17, 0)
        addstr("      ")
        move(17, 0)
        addstr("x: ")
        addstr(posX)
        
        move(18, 0)
        addstr("      ")
        move(18, 0)
        addstr("y: ")
        addstr(posY)
    }
}