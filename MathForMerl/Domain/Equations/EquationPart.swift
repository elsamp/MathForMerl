//
//  EquationChunk.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct EquationPart{
    
    let equationIndex:Int
    let term: Int
    let partOperator: EquationOperator?
    let isFirstPart: Bool
    var partId: String {
        "\(equationIndex)-\(term)"
    }
}
