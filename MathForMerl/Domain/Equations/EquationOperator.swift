//
//  EquationOperator.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

enum Operator {
    case add
    case subtract
    case multiply
    case divide
}

struct EquationOperator {
    
    let oporator: Operator
    let operatorAction: (Int, Int) -> Int

}
