//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game = Game.shared
    
    let levelViewModel: LevelViewModel
    let playerSelectionViewModel: PlayerSelectionViewModel
    //add the unlock VM

    
    var body: some View {
        NavigationStack {
            
            if game.gameState == .levelAnswerEvaluation {
                LevelView(viewModel: levelViewModel)
            } else {
                PlayerSelectionView(viewModel: playerSelectionViewModel)
            }
            
        }
    }
    
    
}

#Preview {
    ContentView(levelViewModel: LevelViewModel(level: PreviewExampleBuilder.shared.exampleLevel()), playerSelectionViewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()))
}
