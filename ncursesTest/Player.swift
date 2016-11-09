//
//  Player.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/17/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

class Player: Actor {
    
    static let sharedInstance = Player(x: Int(Map.width / 2), y: Int(Map.height / 2))
}