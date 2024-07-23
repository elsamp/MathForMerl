//
//  LevelViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation

protocol LevelDelegate {
    func transitionToEquationEvaluation()
    func transitionToUnlockSelection()
}

class LevelViewModel: ObservableObject {
    
    var level: Level
    var player: Player
    @Published var currentEquation: Equation?
    @Published var answerOptions: AnswerOptions?
    var delegate: LevelDelegate
    @Published var playerProgressXP = 0
    
    init(player: Player, level: Level, delegate: LevelDelegate) {
        self.player = player
        self.level = level
        self.delegate = delegate
        
        nextEquation()
    }
    
    func evaluate(answer: Int) -> Bool {
        
        delegate.transitionToEquationEvaluation()
        
        if let equation = currentEquation {
            let result = equation.answerPart.term == answer
            
            if result {
                grantXP()
                if !level.isComplete{
                    nextEquation()
                } else {
                    currentEquation = nil
                    answerOptions = nil
                }
                
                return true
                
            } else {
                nextEquation()
                return false
            }
            
        } else {
            //no current equation, something is really wrong
            fatalError()
        }

        
    }
    
    func grantXP(){
        print("Correct! adding xp")
        playerProgressXP += 10
        
        let newXpTotal = playerProgressXP + 10
        
        if newXpTotal < level.levelRequiredXP {
            playerProgressXP = newXpTotal
        } else {
            playerProgressXP = level.levelRequiredXP
            completeLevel()
        }
    }
    
    func completeLevel() {
        level = Level(config: level.config, levelCount: level.levelCount, isComplete: true)
        delegate.transitionToUnlockSelection()
        print("Level complete!")
    }
    
    func nextEquation() {
        currentEquation = LevelBuilder.shared.buildEquation()
        
        if let equation = currentEquation {
            answerOptions = LevelBuilder.shared.buildAnswerOptions(for: equation)
        }
    }
        
}
