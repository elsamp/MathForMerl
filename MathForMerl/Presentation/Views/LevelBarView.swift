//
//  LevelBarView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct LevelBarView: View {
    
    var level: Level
    @State var player: Player
    
    var body: some View {
        ZStack {

            let widthMultiplier = Double(player.currentXP)/Double(level.levelRequiredXP)
            
            //Level Bar
            ZStack(alignment: .leading) {
                //Background Bar (total XP needed)
                Rectangle()
                    .fill(.gray)
                    .frame(height: 40)
                    .border(.black, width: 2)
                
                //Forground bar (player current XP)
                Rectangle()
                    .fill(.green)
                    .frame(height: 40)
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * widthMultiplier
                    }
                    .border(.black, width: 2)
            }
            .padding(.horizontal, 90)


            //Icons
            HStack(alignment: .top) {
                    //Level Indicator
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 100)
                        Text(String(level.levelCount))
                            .font(.system(size: 70))
                            .foregroundStyle(.blue)
                            .fontWeight(.black)
                    }
                    
                    Spacer()
                    
                    //Lock Icon
                    // TODO: Replace with Image()
                    Rectangle()
                        .fill(.gray)
                        .frame(width:100, height: 100)

            }
            
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    ZStack {
        Color.indigo
        LevelBarView(level: PreviewExampleBuilder.shared.exampleLevel(),
                     player: PreviewExampleBuilder.shared.examplePlayer())
    }
}
