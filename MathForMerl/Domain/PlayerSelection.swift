//
//  LevelSelection.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

struct PlayerSelection {
    
    var playerOptions: [Player]?
    
    init() {
        self.playerOptions = loadPlayerOptions()
    }
    
    private func loadPlayerOptions() -> [Player] {
        
        //TODO: load saved player profiles...
        
        let playerArray = [
            Player(name: "Merl", currentLevel: 1),
            Player(name: "Joe", currentLevel: 4)
        ]
        return playerArray
    }
    
}
