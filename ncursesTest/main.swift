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

// Show the main character on the screen
let player = Actor(x: 4, y: 4)
Map.drawLocalMap()
mvaddch(Int32(player.position.y), Int32(player.position.x), UInt32("@"))
ControlsManager.sharedInstance.printPlayerPosition(player)
repeat {
    let ch = getch()
    Map.drawLocalMap()
    if !ControlsManager.sharedInstance.processInput(UInt32(ch), player: player) {
        break
    }
    
    ControlsManager.sharedInstance.printPlayerPosition(player)
    
    refresh()
} while 1 == 1

endwin()