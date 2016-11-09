//
//  Player-Drawing.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 11/8/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

extension Player {
    func drawPlayer() {
        let horizontalOffset = Int(ceil(Double(Map.localMapWidth) / 2))
        let verticalOffset   = Int(ceil(Double(Map.localMapHeight) / 2))
        
        mvaddch(Int32(verticalOffset), Int32(horizontalOffset), UInt32("@"))
    }
}