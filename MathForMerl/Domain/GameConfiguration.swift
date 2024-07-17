//
//  GameConfiguration.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct GameConfiguration {
    
    static let shared = GameConfiguration()
    
    //Game config constants
    var levelXPBase = 100
    
    var maxNumber: Int
    var minNumber: Int
    var availiableOperators: [Operator]
    var leftSideTermCount: Int
    var rightSideTermCount: Int
    
    private init() {
        //TODO: load actual settings
        
        self.maxNumber = 20
        self.minNumber = -10
        self.availiableOperators = [.add]
        self.leftSideTermCount = 2
        self.rightSideTermCount = 1
        
    }
}
