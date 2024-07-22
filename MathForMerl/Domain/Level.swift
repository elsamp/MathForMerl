//
//  Level.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

@Observable
class Level {
    
    let levelCount: Int
    let levelRequiredXP: Int
    var currentEquation: Equation
    var answerOptions: AnswerOptions
    var player: Player
    var isComplete = false
    
    init(levelCount: Int, levelRequiredXP: Int, currentEquation: Equation, answerOptions: AnswerOptions, player: Player) {
        self.levelCount = levelCount
        self.levelRequiredXP = levelRequiredXP
        self.currentEquation = currentEquation
        self.answerOptions = answerOptions
        self.player = player
    }
    
    static func requiredXP(for level: Int) -> Int {
        Int(round(Double(GameConfiguration.shared.levelXPBase) * Double(level) * 0.8))
    }
    
    func grantXp(to player: Player) {
        // TODO: make this fancier and more nuanced
        let newXpTotal = player.currentXP + 10
        
        if newXpTotal < levelRequiredXP {
            player.currentXP = newXpTotal
        } else {
            player.currentXP = levelRequiredXP
            isComplete = true
            Game.shared.transitionToUnlockSelection()
            
            print("Level complete!")
        }
        
        print("Player XP is: \(player.currentXP)  |  Level Total XP is: \(levelRequiredXP)")
    }
    
    func nextEquation() {
        currentEquation = LevelBuilder.shared.buildEquation()
        answerOptions = LevelBuilder.shared.buildAnswerOptions(for: currentEquation)
    }

}
