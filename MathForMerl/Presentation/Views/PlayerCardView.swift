//
//  PlayerCardView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct PlayerCardView: View {
    
    let player: Player
    let selectionAction: (Player) -> Void
    
    var body: some View {
        Button() {
            selectionAction(player)
        } label: {
            VStack {
                Image(systemName: "person.circle.fill")
                    .scaleEffect(CGSize(width: 3.0, height: 3.0))
                Text(player.name)
                    .padding(50)
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    ZStack {
        Color.yellow
        //PlayerCardView()
    }
    
}
