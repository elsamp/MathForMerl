//
//  GameBuilder.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct LevelBuilder {
    
    static let shared = LevelBuilder()
    let config = LevelConfiguration() // TODO: revisit this
    
    private init() { }

    func buildLevel(for player: Player) -> Level {
        return Level(config: config, levelCount: player.currentLevel)
    }
    
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
    
    func buildAnswerOptions(for equation: Equation) -> AnswerOptions {
        
        let answer = equation.answerPart.term
        var answerArray = [Int]()
        
        for _ in 0..<(config.numAnswerOptions - 1) {
            
            var unique = false
            var answerOption: Int?
            
            while !unique {
                
                answerOption = Int.random(in: config.minNumber...config.maxNumber)
                if !answerArray.contains(answerOption ?? 0){
                    unique = true
                }
            }
            
            answerArray.append(answerOption ?? 0)
        }
        
        //TODO: revisit, this might not be needed
        var index = Int.random(in: 0..<config.numAnswerOptions)
        answerArray.insert(answer, at: index)
        
        return AnswerOptions(answerArray: answerArray, answerIndex: index)
    }
                                    
    func buildRandomOperator() -> EquationOperator{
        
        let chosenOperater = config.availiableOperators.randomElement() ?? .add
        return EquationOperator(equationOperator:chosenOperater , operatorAction: EquationOperator.actionFor(operator: chosenOperater))
    }
    
    
                                        
}
