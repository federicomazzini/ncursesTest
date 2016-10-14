//
//  GroundType.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

struct GroundType : Passable {
    var character: UInt32
    var passable : Bool
    
    init(value: Int) {
        let ground = GroundCharacters(rawValue: value)
        
        let ch = ground!.char
        let s = String(ch).unicodeScalars
//        s[s.startIndex].value
        
        self.character = s[s.startIndex].value
        self.passable = passableMapper[GroundCharacters(rawValue: value)!]!
    }
    
    mutating func change(value: Int) {
        let ground = GroundCharacters(rawValue: value)
        
        let ch = ground!.char
        let s = String(ch).unicodeScalars
//        s[s.startIndex].value
        
        self.character = s[s.startIndex].value
        self.passable = passableMapper[GroundCharacters(rawValue: value)!]!
    }
    
    //passable
    let passableMapper: [GroundCharacters: Bool] = [
        .floor: true,
        .wall: false
    ]
}