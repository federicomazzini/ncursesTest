//
//  MapNode.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

class MapNode {
    var position : Position
    var groundType : GroundType
    
    init(position: Position, groundType: GroundType) {
        self.position = position
        self.groundType = groundType
    }
    
    func isPassable() -> Bool {
        if self.groundType.passable {
            return true
        } else {
            return false
        }
    }
}