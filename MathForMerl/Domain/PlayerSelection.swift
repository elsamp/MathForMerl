//
//  LevelSelection.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

struct PlayerSelection {
    
    var currentPlayer: Player?
    var playerOptions: [Player]?
    
    init() {
        loadPlayerOptions()
    }
    
    mutating private func loadPlayerOptions() {
        
        //TODO: load saved player profiles... should be doing this in the builder
        
        let playerArray = [Player(name: "Merl", currentXP: 20), Player(name: "Joe", currentXP: 10)]
        playerOptions = playerArray
    }
    
}
