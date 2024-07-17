//
//  EquationSide.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct EquationSide {
    
    let equationParts: [EquationPart]
    
    func evaluateSide() -> Int{
        
        var totalValue = 0
        
        for part in equationParts {
            if part.isFirstPart {
                totalValue += part.term.term
            } else {
                
                //TODO: rethink error handling
                totalValue = resultOf(value: totalValue, with: part) ?? totalValue
            }
        }
        
        return totalValue
    }
    
    private func resultOf(value: Int, with part: EquationPart) -> Int? {
        
        if let partOperator = part.partOperator {
            return partOperator.operatorAction(value, part.term.term)
        }
        
        //TODO: should throw error
        return nil
    }
}
