//
//  AnswerOptionsView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct AnswerOptionsView: View {
    
    var answerOptions: AnswerOptions
    
    var body: some View {
        
        HStack {
            ForEach(answerOptions.answerArray, id: \.self) { number in
                TermView(term: String(number))
            }
            .padding()
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        AnswerOptionsView(answerOptions: PreviewExampleBuilder.shared.exampleAnswerOptions())
    }
}
