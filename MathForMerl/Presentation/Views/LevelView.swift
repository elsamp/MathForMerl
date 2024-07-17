//
//  LevelView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct LevelView: View {
    
    let viewModel: LevelViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
            VStack {
                
                LevelBarView(level: 1, levelXP: 100, currentXP: 20)
                Spacer ()
            
                EquationView(equation: viewModel.level.currentEquation)
                Spacer()
                
                AnswerOptionsView(answerOptions: viewModel.level.answerOptions)
                    .padding(30)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func exampleTerms() -> [Int] {
        return [5,12,6]
    }
    
    func exampleAnswers() -> [Int] {
        return [5,4,6,-5]
    }
}

#Preview {
    LevelView(viewModel: LevelViewModel(level: PreviewExampleBuilder.shared.exampleLevel()))
}
