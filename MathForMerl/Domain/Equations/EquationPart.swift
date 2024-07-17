//
//  EquationChunk.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct EquationPart {
    
    let equationIndex:Int
    let term: Int
    let partOperator: EquationOperator?
    let isFirstPart: Bool
    var isAnswerPart: Bool
    
    init(equationIndex: Int, term: Int, partOperator: EquationOperator?, isFirstPart: Bool) {
        self.equationIndex = equationIndex
        self.term = term
        self.partOperator = partOperator
        self.isFirstPart = isFirstPart
        self.isAnswerPart = false
    }
    
    var partId: String {
        "\(equationIndex)-\(term)"
    }
    
    mutating func setAsAnswer() {
        isAnswerPart = true
    }
}
