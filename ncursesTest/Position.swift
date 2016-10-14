//
//  Position.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

struct Position {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func change(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}