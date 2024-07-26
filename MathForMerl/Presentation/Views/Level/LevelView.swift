//
//  LevelView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct LevelView: View {
    
    @StateObject var viewModel: LevelViewModel
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
            
            if gameViewModel.gameState == GameState.levelAnswerEvaluation || gameViewModel.gameState == GameState.levelEquationPresented {
                VStack {
                    
                    LevelBarView()
                        .padding(.top, 30)
                    Spacer()
                    
                    if let equation = viewModel.currentEquation {
                        EquationView(equation: equation)
                    }
                    Spacer()
                    if let answers = viewModel.answerOptions {
                        AnswerOptionsView(answerOptions: answers, selectionAction: viewModel.evaluate(answer:))
                            .padding(.bottom, 30)
                    }
                }
                .padding()
                
            } else if gameViewModel.gameState == GameState.unlockOptionsPresented || gameViewModel.gameState == GameState.unlockSelected {
                
                if let unlockViewModel = gameViewModel.unlockSelectionViewModel {
                    UnlockSelectionView(viewModel: unlockViewModel)
                        .padding(90)
                }
            }
        }
        .ignoresSafeArea()
        .environmentObject(viewModel)
    }
}

#Preview {
    LevelView(viewModel: LevelViewModel(player: PreviewExampleBuilder.shared.examplePlayer(),
                                        level: PreviewExampleBuilder.shared.exampleLevel(),
                                        delegate: PreviewLevelDelegate()))
    .environmentObject(GameViewModel())
}
