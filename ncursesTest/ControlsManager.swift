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
        
        let x = player.position.x
        let y = player.position.y
        
        if ch == UInt32((KEY_LEFT)) {
            player.position.x = player.position.x - 1
        } else if ch == UInt32(KEY_RIGHT) {
            player.position.x = player.position.x + 1
        } else if ch == UInt32(KEY_UP) {
            player.position.y = player.position.y - 1
        } else if ch == UInt32(KEY_DOWN) {
            player.position.y = player.position.y + 1
        }
        
        mvaddch(Int32(y), Int32(x), UInt32("."))
        mvaddch(Int32(player.position.y), Int32(player.position.x), UInt32("@"))
        
        refresh()
        
        return true
    }
}