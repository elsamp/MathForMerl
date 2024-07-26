//
//  PlayerSelectionView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct PlayerSelectionView: View {
    
    var viewModel:PlayerSelectionViewModel
    @Binding var path: NavigationPath
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
            
            HStack {
                if let players = viewModel.availablePlayers() {
                    ForEach(players) { player in
                        PlayerCardView(player: player, path: $path, selectionAction: { player in
                            viewModel.select(player: player)
                        })
                        
                    }
                }
                
                //TODO: add player creation card
                VStack {
                    //Replace with actual form
                    Button("Add Player") {
                        let player =  viewModel.createNewPlayer(name: "Merl")
                        viewModel.select(player: player)
                        path.append(player)
                    }
                }
            }
            .navigationDestination(for: Player.self) { p in
                
                if let levelViewModel = gameViewModel.levelViewModel {
                    LevelView(viewModel: levelViewModel)
                        .transition(.opacity)
                }
            }
            
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    
    @State var path = NavigationPath()
    return PlayerSelectionView(viewModel: PlayerSelectionViewModel(selectionDelegate: PreviewPlayerSelectionDelegate(), playerSelection: PlayerManager()), path: $path)
}
