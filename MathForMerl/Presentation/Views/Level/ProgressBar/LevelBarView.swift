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
    
    private let showIcons = true //for developer testing only
    private let totalWidthMultiplier = 0.8
    private let barHeight = 40.0
    
    var body: some View {
        ZStack {

            let xPwidthMultiplier = Double(player.currentXP)/Double(level.levelRequiredXP)
            
            //Level Bar
            ZStack(alignment: .leading) {

                    //Background Bar (total XP needed)
                    Rectangle()
                        .fill(.gray)
                        .frame(height: barHeight)
                        .border(.black, width: 2)
                    
                    //Forground bar (player current XP)
                    Rectangle()
                        .fill(.green)
                        .frame(height: barHeight)
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * xPwidthMultiplier * totalWidthMultiplier
                        }
                        .border(.black, width: 2)

            }
            .containerRelativeFrame(.horizontal) { width, axis in
                width * totalWidthMultiplier
            }

            if showIcons {
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
