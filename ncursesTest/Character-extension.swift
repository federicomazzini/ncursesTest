//
//  Character-extension.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/12/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

extension Character {
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}