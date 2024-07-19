//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = Game.shared

    let playerSelectionViewModel: PlayerSelectionViewModel
    //add the unlock VM

    
    var body: some View {
        NavigationStack {
            
            if game.gameState == .levelAnswerEvaluation {
                
                if let player = game.currentPlayer {
                    
                    //TODO: reevaluate if this is the right place to create the viewModel
                    let levelViewModel = LevelViewModel(player: player)
                    LevelView(viewModel: levelViewModel)
                        .transition(.opacity)
                }
                
                
            } else {
                PlayerSelectionView(viewModel: playerSelectionViewModel)
                    .transition(.opacity)
            }
            
        }
    }
    
    
}

#Preview {
    ContentView(playerSelectionViewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()))
}
