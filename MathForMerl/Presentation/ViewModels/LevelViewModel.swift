//
//  LevelViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

@Observable
class LevelViewModel {
    
    let level: Level
    let player: Player
    
    init(player: Player) {
        self.level = LevelBuilder.shared.buildLevel()
        self.player = player
    }
    
    //TODO: fix the injection
    func evaluate(answer: Int) -> Bool {
        
        Game.shared.transitionState(to: .levelAnswerEvaluation)
        let result = level.currentEquation.answerPart.term == answer
        
        //TODO: move this so it isn't a side effect
        if result {
            
            print("Correct! adding xp")
            
            level.grantXp(to: player)
        }
        
        nextEquation()

        return result
    }
    
    func nextEquation() {
        level.nextEquation()
    }
        
}
