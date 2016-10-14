//
//  Actor.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

class Actor {
    var position : Position
    
    init(x: Int, y: Int) {
        self.position = Position(x: x, y: y)
    }
}