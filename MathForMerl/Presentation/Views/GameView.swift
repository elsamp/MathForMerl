//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct GameView: View {

    @State private var path = NavigationPath()
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            
            if let selectionViewModel = gameViewModel.playerSelectionViewModel {
                PlayerSelectionView(viewModel: selectionViewModel, path: $path)
            }
        }
    }
    
    
}

#Preview {
    GameView()
}
