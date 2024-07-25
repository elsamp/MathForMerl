//
//  GameViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-23.
//

import Foundation

enum GameState {
    case initialLaunch
    case playerSelection
    case playerCreation
    case levelEquationPresented
    case levelAnswerEvaluation
    case unlockOptionsPresented
    case unlockSelection
}


class GameViewModel: ObservableObject, PlayerSelectionDelegate, LevelDelegate {
    
    var playerSelectionViewModel: PlayerSelectionViewModel?
    var levelViewModel: LevelViewModel?
    var unlockSelectionViewModel: UnlockSelectionViewModel?
    
    var gameState = GameState.initialLaunch
    var player: Player? //will set with player selection
    var level: Level? //can create when player and config are defined
    
    
    init () {
        transitionToPlayerSelection()
    }
    
    private func setActive(player: Player) {
        self.player = player
    }
    
    private func setActive(level: Level) {
        self.level = level
    }
    
    func loadConfiguration(for player: Player) -> LevelConfiguration {
        //TODO: make this actually load
        return LevelConfiguration()
    }
    
    func resetGame(){
        gameState = .playerSelection
        //reset everything if starting new came from somewhere else
    }
    
    
    //MARK: Update Game State
    func transitionToPlayerSelection() {
        let playerSelection = PlayerSelection()
        playerSelection.loadPlayerOptions()
        playerSelectionViewModel = PlayerSelectionViewModel(selectionDelegate: self, playerSelection: playerSelection)
    }
    
    func transitionToLevel(with player: Player) {
        setActive(player: player)
        let level = LevelBuilder.shared.buildLevel(for: player)
        levelViewModel = LevelViewModel.init(player: player, level: level, delegate: self)
        transitionState(to: .levelEquationPresented)
    }
    
    func transitionToEquationEvaluation() {
        transitionState(to: .levelAnswerEvaluation)
    }
    
    func transitionToUnlockSelection() {
        transitionState(to: .unlockOptionsPresented)
    }
    
    private func transitionState(to newState: GameState) {
        
        //TODO: add error handling logic
        switch newState {
        case .initialLaunch:
            gameState = .initialLaunch
            break
        case .playerSelection:
            gameState = newState
            break
        case .playerCreation:
            gameState = newState
            break
        case .levelEquationPresented:
            //make sure level is set
            gameState = newState
            break
        case .levelAnswerEvaluation:
            //can only transition from levelEquationPresented
            gameState = newState
            break
        case .unlockOptionsPresented:
            gameState = newState
            break
        case .unlockSelection:
            //can only transition from unlockOptionsPresented
            gameState = newState
            break
        }
        
        print("Game: game state changed to: \(newState)")
        
    }
    
}
