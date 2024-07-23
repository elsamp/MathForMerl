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
    
    func examplePlayer() -> Player {
        return Player(name: "Merl", currentLevel: 3)
    }
    
    func exampleEquation() -> Equation {
        return LevelBuilder.shared.buildEquation()
    }
    
    func exampleLevel() -> Level {
        return Level(config: LevelConfiguration(), levelCount: 3)
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
