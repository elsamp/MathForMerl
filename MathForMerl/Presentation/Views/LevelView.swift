//
//  LevelView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct LevelView: View {
    
    @Bindable var viewModel: LevelViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
            VStack {
                
                //TODO: fix the explicit unwrap
                LevelBarView(level: viewModel.level, player: viewModel.player)
                Spacer ()
            
                EquationView(equation: viewModel.level.currentEquation)
                Spacer()
                
                AnswerOptionsView(answerOptions: viewModel.level.answerOptions, selectionAction: viewModel.check(answer:))
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
    LevelView(viewModel: LevelViewModel(player: PreviewExampleBuilder.shared.examplePlayer()))
}
