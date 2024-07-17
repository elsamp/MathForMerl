//
//  AnswerOptionsView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct AnswerOptionsView: View {
    
    var answerOptions: [Int]
    
    var body: some View {
        
        HStack {
            ForEach(answerOptions, id: \.self) { number in
                TermView(term: number)
            }
            .padding()
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        AnswerOptionsView(answerOptions: [4,5,6,2])
    }
}
