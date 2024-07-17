//
//  EquationView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct EquationView: View {
    
    var terms: [Int]
    var answer: Int
    
    var body: some View {
        
        HStack {
            //Need equation sequence instead
            ForEach(terms, id: \.self) { number in
                TermView(term: number)
            }
            
            Text("=")
                .font(.system(size: 70))
                .foregroundStyle(.black)
                .fontWeight(.black)
            
            TermView(term: answer)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue
        EquationView(terms:[4, 5], answer: 32)
    }
}
