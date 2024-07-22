//
//  PlayerSelectionView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct PlayerSelectionView: View {
    
    @Bindable var viewModel:PlayerSelectionViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
            
            HStack {
                
                if let players = viewModel.availablePlayers() {
                    ForEach(players) { player in
                        PlayerCardView(player: player, path: $path, selectionAction: { player in
                            viewModel.select(player: player)
                        })
                        .navigationDestination(for: Player.self) { p in
                            let levelViewModel = LevelViewModel(player: p)
                            LevelView(viewModel: levelViewModel)
                                .transition(.opacity)
                        }
                    }
                    
                    //TODO: add player creation card
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    
    @State var path = NavigationPath()
    return PlayerSelectionView(viewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()), path: $path)
}
