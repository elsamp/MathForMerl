//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = Game.shared
    @State private var path = NavigationPath()

    let playerSelectionViewModel: PlayerSelectionViewModel
    //add the unlock VM

    
    var body: some View {
        NavigationStack(path: $path) {
            
            PlayerSelectionView(viewModel: playerSelectionViewModel, path: $path)
                    .transition(.opacity)
        }
    }
    
    
}

#Preview {
    ContentView(playerSelectionViewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()))
}
