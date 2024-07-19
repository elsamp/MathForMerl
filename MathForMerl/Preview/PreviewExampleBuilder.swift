//
//  PreviewExampleBuilder.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

struct PreviewExampleBuilder {
    
    static let shared = PreviewExampleBuilder()
    
    init() { }
    
    func exampleGame(at state: GameState){
        
        switch state {
        case .playerSelection:
            Game.shared.transitionState(to: .playerSelection)
        case .playerCreation:
            Game.shared.transitionState(to: .playerCreation)
        case .levelEquationPresented:
            Game.shared.transitionToLevel(with: examplePlayer())
        case .levelAnswerEvaluation:
            Game.shared.transitionToLevel(with: examplePlayer())
            Game.shared.transitionState(to: .levelAnswerEvaluation)
        case .unlockOptionsPresented:
            Game.shared.transitionToLevel(with: examplePlayer())
            Game.shared.transitionState(to: .unlockOptionsPresented)
        case .unlockSelection:
            Game.shared.transitionToLevel(with: examplePlayer())
            Game.shared.transitionState(to: .unlockOptionsPresented)
        }

    }
    
    func examplePlayer() -> Player {
        return Player(name: "Merl", currentXP: 34)
    }
    
    func exampleEquation() -> Equation {
        return LevelBuilder.shared.buildEquation()
    }
    
    func exampleLevel() -> Level {
        return Level(levelCount: 2, levelRequiredXP: 100, currentEquation: exampleEquation(), answerOptions: exampleAnswerOptions(), player: examplePlayer())
    }
    
    func exampleEquationSide() -> EquationSide {
        return LevelBuilder.shared.buildEquationLeftSide(termCount: 3)
    }
    
    func exampleEquationPart() -> EquationPart {
        let equationOperator = EquationOperator(equationOperator: .add, operatorAction: EquationOperator.actionFor(operator: .add))
        return EquationPart(equationIndex: 1, term: 8, partOperator: equationOperator, isFirstPart: false)
    }
    
    func exampleAnswerOptions() -> AnswerOptions {
        AnswerOptions(answerArray: [5,-3,6,12], answerIndex: 3)
    }
    
    func exampleAnswerSelectionAction() -> ((Int) -> Bool) {
        return { num in true }
    }

}
