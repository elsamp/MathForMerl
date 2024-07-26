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
    case unlockSelected
}


class GameViewModel: ObservableObject, PlayerSelectionDelegate, LevelDelegate, UnlockDelegate {

    var playerSelectionViewModel: PlayerSelectionViewModel?
    var levelViewModel: LevelViewModel?
    var unlockSelectionViewModel: UnlockSelectionViewModel?
    
    @Published var gameState = GameState.initialLaunch
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
    
    func selected(unlock: any UnlockBranchProtocol) {
        //Update configuration
        
        //change game state
        if let player = player {
            transitionToLevel(with: player)
        }
    }
    
    func resetGame(){
        gameState = .playerSelection
        //reset everything if starting new came from somewhere else
    }
    
    
    //MARK: Update Game State
    func transitionToPlayerSelection() {
        let playerSelection = PlayerManager()
        playerSelection.loadPlayerOptions()
        playerSelectionViewModel = PlayerSelectionViewModel(selectionDelegate: self, playerSelection: playerSelection)
    }
    
    func transitionToLevel(with player: Player) {
        setActive(player: player)
        let level = LevelBuilder.shared.buildLevel(for: player)
        
        if levelViewModel == nil {
            levelViewModel = LevelViewModel(player: player, level: level, delegate: self)
        } else {
            levelViewModel?.level = level
            levelViewModel?.nextEquation()
        }
        transitionState(to: .levelEquationPresented)
    }
    
    func transitionToEquationEvaluation() {
        transitionState(to: .levelAnswerEvaluation)
    }
    
    func transitionToUnlockSelection() {
        
        if let player = player {
            unlockSelectionViewModel = UnlockSelectionViewModel(unlockTree: player.unlockTree, unlockSelectionDelegate: self)
        }
        
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
        case .unlockSelected:
            //can only transition from unlockOptionsPresented
            gameState = newState
            break
        }
        
        print("Game: game state changed to: \(newState)")
        
    }
    
}
