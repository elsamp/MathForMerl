//
//  GameConfiguration.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct LevelConfiguration {
    
    //Game config constants
    let levelXPBase = 100
    let numAnswerOptions = 4
    
    //load from saved data
    let maxNumber: Int
    let minNumber: Int
    let availiableOperators: [Operator]
    let leftSideTermCount: Int
    let rightSideTermCount: Int
    
    init() {
        //TODO: load actual settings
        
        self.maxNumber = 20
        self.minNumber = -10
        self.availiableOperators = [.add]
        self.leftSideTermCount = 3
        self.rightSideTermCount = 1 //can only be 1 right now
        
    }
}
