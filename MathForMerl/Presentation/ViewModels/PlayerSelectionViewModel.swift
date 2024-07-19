//
//  PlayerSelectionViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

@Observable
class PlayerSelectionViewModel {
    
    var playerSelection: PlayerSelection
    
    init(playerSelection: PlayerSelection) {
        self.playerSelection = playerSelection
    }
    
    func select(player: Player) {
        print("PlayerSelectionViewModel: selected player \(player)")
        Game.shared.transitionToLevel(with: player)
    }
    
    func availablePlayers() -> [Player]? {
        playerSelection.playerOptions
    }
}
