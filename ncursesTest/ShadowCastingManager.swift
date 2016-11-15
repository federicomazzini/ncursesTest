//
//  ShadowCastingManager.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 11/11/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation

class ShadowCastingManager {
    static let sharedInstance = ShadowCastingManager()
    
    var startSlope : Double = 1.0
    
    var multipliers = [
        [1, 0, 0, -1, -1, 0, 0, 1],
        [0, 1, -1, 0, 0, -1, 1, 0],
        [0, 1, 1, 0, 0, -1, -1, 0],
        [1, 0, 0, 1, -1, 0, 0, -1]
        ]

    func castLight(x: Int, y: Int, radius: Int, row: Int,
                   startSlope : Double, endSlope: Double, xx: Int, xy: Int, yx: Int,
                   yy: Int) {
        
                        if self.startSlope < endSlope {
                            return
                        }

                        var nextStartSlope = self.startSlope
        
//                        if row > radius {
//                            print("***")
//                        }
        
                        for i in row...radius {
                            var blocked = false
                            let dx = -i, dy = -i
                            
//                            if dx > 0 {
//                                print("***")
//                            }
                            
                            for j in dx...0 {
                                let lSlope : Double = (Double(j) - 0.5) / (Double(dy) + 0.5)
                                let rRlope : Double = (Double(j) + 0.5) / (Double(dy) - 0.5)
                                if self.startSlope < rRlope {
                                    continue
                                } else if endSlope > lSlope {
                                    break
                                }
                                
                                // Translate the dx, dy coordinates into map coordinates.
                                let ax : Int = x + j * xx + dy * xy
                                let ay : Int = y + j * yx + dy * yy
//                                if ((sax < 0 && Int(abs(sax)) > x) ||
//                                    (say < 0 && Int(abs(say)) > y)) {
//                                    continue
//                                }
//                                let ax : Int = x + sax
//                                let ay : Int = y + say
                                
                                if !Map.sharedInstance.memoryMapPositionExists(Position(x: ax, y: ay)) {
                                    continue
                                }
                                
//                                if ax >= Map.sharedInstance.width || ay >= Map.sharedInstance.height {
//                                    continue
//                                }
                                
                                let radius2 : Int = radius * radius
                                if Int(j * j + dy * dy) < radius2 {
                                    let mapNode = Map.sharedInstance.memoryMap[ay][ax]
                                    mapNode.visible = true
                                }
                                
                                let mapNode = Map.sharedInstance.memoryMap[ay][ax]
                                if blocked {
                                    if mapNode.opaque {
                                        nextStartSlope = rRlope
                                        continue
                                    } else {
                                        blocked = false
                                        self.startSlope = nextStartSlope
                                    }
                                } else if mapNode.opaque && i < radius {
                                    blocked = true
                                    castLight(x, y: y, radius: radius, row: i + 1, startSlope: self.startSlope, endSlope: lSlope, xx: xx,
                                              xy: xy, yx: yx, yy: yy)
                                    nextStartSlope = rRlope
                                }
                            }
                            if blocked {
                                break
                            }
                        }
    }

    func doFOV(x: Int, y: Int, radius: Int) {
        for i in 0...7 {
            self.startSlope = 1.0
            castLight(x, y: y, radius: radius, row: 1, startSlope: self.startSlope, endSlope: 0.0, xx: multipliers[0][i],
                      xy: multipliers[1][i], yx: multipliers[2][i], yy: multipliers[3][i])
        }
    }
    
}