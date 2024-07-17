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
    
    let equationOperator: Operator
    let operatorAction: (Int, Int) -> Int
    
    static func actionFor(operator equationOp: Operator) -> ((Int, Int) -> Int) {
        
        switch equationOp {
        case .add:
            return { num1, num2 in num1 + num2 }
        case .subtract:
            return { num1, num2 in num1 - num2 }
        case .multiply:
            return { num1, num2 in num1 * num2 }
        case .divide:
            return { num1, num2 in num1 / num2 }
        }
    }
    
    //TODO: will need to update this with images to properly support devision
    static func string(for equationOp: Operator) -> String {
        switch equationOp {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        }
    }

}
