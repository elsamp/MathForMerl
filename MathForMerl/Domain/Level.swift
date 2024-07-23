//
//  Level.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct Level {
    
    let levelCount: Int
    let levelRequiredXP: Int
    let isComplete: Bool
    let config: LevelConfiguration
    
    init(config: LevelConfiguration, levelCount: Int, isComplete: Bool = false) {
        self.levelCount = levelCount
        self.config = config
        self.levelRequiredXP = 200 //TODO: make this calculate
        self.isComplete = isComplete
    }
    
}
