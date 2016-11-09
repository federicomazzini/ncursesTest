//
//  Actor-Drawing.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/17/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

extension Actor {
    func draw() {
        mvaddch(Int32(self.position.y), Int32(self.position.x), UInt32("@"))
    }
}