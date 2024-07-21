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
                
                LevelBarView(level: viewModel.level, player: viewModel.player)
                    .padding(.top, 30)
                Spacer()
                EquationView(equation: viewModel.level.currentEquation)
                Spacer()
                AnswerOptionsView(answerOptions: viewModel.level.answerOptions, selectionAction: viewModel.check(answer:))
                    .padding(.bottom, 30)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LevelView(viewModel: LevelViewModel(player: PreviewExampleBuilder.shared.examplePlayer()))
}
