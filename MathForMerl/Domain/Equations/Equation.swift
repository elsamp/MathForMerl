//
//  Equation.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct Equation {
    
    var rightSide: EquationSide
    var leftSide: EquationSide
    var answerPart: EquationPart
    
    init(rightSide: EquationSide, leftSide: EquationSide) {
        self.rightSide = rightSide
        self.leftSide = leftSide
        
        let index = Int.random(in: 0..<leftSide.equationParts.count)

        self.leftSide.equationParts[index].setAsAnswer()
        self.answerPart = leftSide.equationParts[index]
        self.answerPart.setAsAnswer()

        
        print("Answer Term:\(answerPart.term) Is True: \(answerPart.isAnswerPart)")
    }
    
    func isEquationTrue() -> Bool {
        return rightSide.evaluateSide() == leftSide.evaluateSide()
    }
    
}
