//
//  EquationSide.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct EquationSideView: View {
    
    let side: EquationSide
    
    var body: some View {
        
        HStack {
            ForEach(side.equationParts, id:\.self.partId) {part in

                EquationPartView(part: part)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        EquationSideView(side: PreviewExampleBuilder.shared.exampleEquationSide())
    }
}
