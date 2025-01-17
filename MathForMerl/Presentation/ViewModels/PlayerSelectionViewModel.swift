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
    
    var playerSelection: PlayerManager
    private weak var selectionDelegate: PlayerSelectionDelegate?
    
    init(selectionDelegate: PlayerSelectionDelegate, playerSelection: PlayerManager) {
        self.playerSelection = playerSelection
        self.selectionDelegate = selectionDelegate
    }
    
    func select(player: Player) {
        print("PlayerSelectionViewModel: selected player \(player)")
        selectionDelegate?.transitionToLevel(with: player)
    }
    
    func availablePlayers() -> [Player]? {
        playerSelection.playerOptions
    }
    
    func createNewPlayer(name: String) -> Player {
        let player = Player(name: name, currentLevel: 1, unlockTree: UnlockTree())
        playerSelection.addNew(player: player)
        return player
    }
    
}
