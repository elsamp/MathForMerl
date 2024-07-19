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
    func check(answer: Int) -> Bool {
        let result = level.currentEquation.answerPart.term == answer
        
        //TODO: move this so it isn't a side effect
        if result {
            
            print("Correct! adding xp")
            
            // TODO: make this not go over the level bounds
            player.currentXP += 10
        }
        
        return result
    }
        
}
