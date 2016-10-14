//
//  GroundCharacters.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

enum GroundCharacters: Int {
    case floor
    case wall
        
    static let charMapper: [GroundCharacters: Character] = [
        .floor: ".",
        .wall: "#"
    ]
    
    var char: Character {
        return GroundCharacters.charMapper[self]!
    }
}