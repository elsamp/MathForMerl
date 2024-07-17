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
    var currentEquation: Equation
    
    init(levelCount: Int, levelRequiredXP: Int, currentEquation: Equation) {
        self.levelCount = levelCount
        self.levelRequiredXP = levelRequiredXP
        self.currentEquation = currentEquation
    }
    
    static func requiredXP(for level: Int) -> Int {
        Int(round(Double(GameConfiguration.shared.levelXPBase) * Double(level) * 0.8))
    }
    
    func nextEquation() -> Equation {
        GameBuilder.shared.buildEquation()
    }

}
