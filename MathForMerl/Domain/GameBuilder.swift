//
//  GameBuilder.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct GameBuilder {
    
    static let shared = GameBuilder()
    let config = GameConfiguration.shared
    
    private init() { }

    
    func buildEquation() -> Equation {
        
        let leftSide = buildEquationLeftSide(termCount: config.leftSideTermCount)
        let rightSide = buildEquationRightSide(termCount: config.rightSideTermCount, leftSideTotal: leftSide.evaluateSide())
        
        return Equation(rightSide: rightSide, leftSide: leftSide)
    }
    
    func buildEquationLeftSide(termCount: Int) -> EquationSide {
        
        var termArray = [Int]()
        
        //Set terms for left side of the equation
        for _ in 0..<termCount {
            termArray.append(Int.random(in: config.minNumber...config.maxNumber))
        }
        
        var partArray = [EquationPart]()
        
        //Create EquationParts for Left Side
        for i in 0..<termArray.count {
            
            if i == 0 {
                let part = EquationPart(equationIndex: i, term: termArray[i], partOperator: nil, isFirstPart: true)
                partArray.append(part)
            } else {
                let part = EquationPart(equationIndex: i, term: termArray[i], partOperator: buildRandomOperator(), isFirstPart: false)
                partArray.append(part)
            }
            
        }

        return EquationSide(equationParts: partArray)
    }
    
    func buildEquationRightSide(termCount: Int, leftSideTotal: Int) -> EquationSide {
        
        //TODO: make this actually support more than one right side term
        var partArray = [EquationPart(equationIndex: 1, term: leftSideTotal, partOperator: nil, isFirstPart: true)]
        return EquationSide(equationParts: partArray)
    }
                                    
    func buildRandomOperator() -> EquationOperator{
        
        let chosenOperater = config.availiableOperators.randomElement() ?? .add
        return EquationOperator(equationOperator:chosenOperater , operatorAction: EquationOperator.actionFor(operator: chosenOperater))
    }
    
    func buildLevel() -> Level {
        //TODO: load this from saved data
        return Level(levelCount: 1, levelRequiredXP: Level.requiredXP(for: 1), currentEquation: buildEquation())
    }
                                        
}
