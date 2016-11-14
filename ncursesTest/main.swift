//
//  main.swift
//  ncursesTest
//
//  Created by Federico Mazzini on 10/4/16.
//  Copyright © 2016 Federico Mazzini. All rights reserved.
//

import Foundation
import Darwin.ncurses

initscr()

start_color()

noecho()

curs_set(0)

keypad(stdscr, true)

//init_pair(1, Int16(COLOR_BLACK), Int16(COLOR_GREEN))

//let message = "Hello world"

//let screenHeight = getmaxy(stdscr)
//let screenWidth = getmaxx(stdscr)

clear()

//let xPos = screenWidth / 2 - message.characters.count / 2
//let yPos = screenHeight / 2
//
//move(yPos, xPos)
//
//attron(COLOR_PAIR(1))
//addstr(message)
//attroff(COLOR_PAIR(1))
//refresh()

ShadowCastingManager.sharedInstance.doFOV(Player.sharedInstance.position.x, y: Player.sharedInstance.position.y, radius: 5)
Map.sharedInstance.drawMemoryMapAroundPlayer()
Player.sharedInstance.drawPlayer()
ControlsManager.sharedInstance.printPlayerPosition()
repeat {
    let ch = getch()
    if !ControlsManager.sharedInstance.processInput(UInt32(ch)) {
        break
    }
    
    ShadowCastingManager.sharedInstance.doFOV(Player.sharedInstance.position.x, y: Player.sharedInstance.position.y, radius: 5)
    Map.sharedInstance.drawMemoryMapAroundPlayer()
    Player.sharedInstance.drawPlayer()
    ControlsManager.sharedInstance.printPlayerPosition()
    
    refresh()
} while 1 == 1

endwin()