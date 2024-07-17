//
//  EquationPartView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct EquationPartView: View {
    
    let part: EquationPart
    
    var body: some View {
        if let partOperator = part.partOperator {
            OperatorView(operatorString: EquationOperator.string(for: partOperator.equationOperator))
        }
        
        if !part.isAnswerPart {
            TermView(term: String(part.term))
        } else {
            TermView(term: "?")
        }
        
    }
}

#Preview {
    ZStack {
        Color.blue
        EquationPartView(part: PreviewExampleBuilder.shared.exampleEquationPart())
    }
}
