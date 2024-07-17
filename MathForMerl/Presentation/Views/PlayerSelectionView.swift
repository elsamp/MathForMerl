//
//  PlayerSelectionView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct PlayerSelectionView: View {
    
    let viewModel:PlayerSelectionViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
            
            HStack {
                
                if let players = viewModel.availablePlayers() {
                    ForEach(players, id: \.playerID) { player in
                        PlayerCardView(player: player, selectionAction: { player in viewModel.select(player: player) })
                    }
                }
                
                //TODO: add playercreation card
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    
    PlayerSelectionView(viewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()))
}
