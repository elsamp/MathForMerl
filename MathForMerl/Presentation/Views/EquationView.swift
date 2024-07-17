//
//  EquationView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct EquationView: View {
    
    var equation: Equation
    
    var body: some View {
        
        HStack {
            
            EquationSideView(side: equation.leftSide)
            OperatorView(operatorString: "=")
            EquationSideView(side: equation.rightSide)
            
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue
        EquationView(equation: PreviewExampleBuilder.shared.exampleEquation())
    }
}
