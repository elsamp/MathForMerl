//
//  PlayerSelectionViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

protocol PlayerSelectionDelegate: AnyObject {
    func transitionToLevel(with player:Player)
}

@Observable
class PlayerSelectionViewModel {
    
    var playerSelection: PlayerSelection
    var selectionDelegate: PlayerSelectionDelegate
    
    init(selectionDelegate: PlayerSelectionDelegate) {
        self.playerSelection = PlayerSelection()
        self.selectionDelegate = selectionDelegate
    }
    
    func select(player: Player) {
        print("PlayerSelectionViewModel: selected player \(player)")
        selectionDelegate.transitionToLevel(with: player)
    }
    
    func availablePlayers() -> [Player]? {
        playerSelection.playerOptions
    }
    
}
