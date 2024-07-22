//
//  Game.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

enum GameState {
    case playerSelection
    case playerCreation
    case levelEquationPresented
    case levelAnswerEvaluation
    case unlockOptionsPresented
    case unlockSelection
}

@Observable
class Game {
    
    static let shared = Game()
    
    var currentPlayer: Player?
    var playerSelection: PlayerSelection?
    var level: Level?
    var gameState: GameState //TODO: move to EnvironmentObject
    
    
    private init() { 
        self.gameState = .playerSelection
        //startNewGame()
    }
    
    func startNewGame(){
        gameState = .playerSelection
        //reset everything if starting new came from somewhere else
    }
    
    func transitionState(to newState: GameState) {
        
        //TODO: add error handling logic
        switch newState {
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
    
    func transitionToLevel(with player: Player) {
        self.currentPlayer = player
        transitionState(to: .levelAnswerEvaluation)
    }
    
    func transitionToUnlockSelection() {
        transitionState(to: .unlockOptionsPresented)
    }
    
}
