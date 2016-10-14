//
//  Map.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/7/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

private enum mapTiles : Int {
    case
    floor = 0,
    wall  = 1
}

class Map {
    static let width  : Int = 19
    static let height : Int = 14
    
    static let map = [
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    ]
    
    static let localMapWidth  : Int = 19
    static let localMapHeight : Int = 14
    
    static var localMap: [[MapNode]] = Map.generateLocalMap()
    
    class func generateLocalMap() -> [[MapNode]] {
        var local = [[MapNode]]()
        
        for row in 0...height {
            var h = [MapNode]()
            for column in 0...width {
                let node = MapNode(position: Position(x: column, y: row), groundType: GroundType(value: map[row][column]))
                h.append(node)
//                local[row][column] = node
            }
            local.append(h)
        }
        
        return local
    }
    
    class func drawLocalMap() {
        for row in 0...localMapHeight {
            for column in 0...localMapWidth {
                
                let mapNode = localMap[row][column]
                let char = mapNode.groundType.character
                mvaddch(Int32(row), Int32(column), char)
                
                // Draw the tile
//                switch( map[row][column] ) {
//                    case mapTiles.floor.rawValue:
//                        mvaddch(Int32(row), Int32(column), UInt32("."))
//                    case mapTiles.wall.rawValue:
//                        mvaddch(Int32(row), Int32(column), UInt32("#"))
//                    default:
//                        break
//                }
            }
        }
        refresh()
    }
    
}