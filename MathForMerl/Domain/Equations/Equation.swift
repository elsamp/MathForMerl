//
//  Equation.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct Equation {
    
    let rightSide: EquationSide
    let leftSide: EquationSide
    
    func isEquationTrue() -> Bool {
        return rightSide.evaluateSide() == leftSide.evaluateSide()
    }
    
}
