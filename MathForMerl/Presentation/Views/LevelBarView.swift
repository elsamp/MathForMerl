//
//  LevelBarView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct LevelBarView: View {
    
    var level: Int
    var levelXP: Int
    var playerXP: Int
    
    var body: some View {
        ZStack {

            let widthMultiplier = Double(playerXP)/Double(levelXP)
            
            //Level Bar
            GeometryReader { geometry in
                Group {
                    //Background Bar (total XP needed)
                    Rectangle()
                        .fill(.gray)
                        .frame(maxWidth:geometry.size.width, maxHeight: 40)
                        .border(.black, width: 2)
                    
                    //Forground bar (player current XP)
                    Rectangle()
                        .fill(.green)
                        .frame(width:(geometry.size.width * widthMultiplier) , height: 40, alignment: .leading)
                        .border(.black, width: 2)
                }
                .frame(maxHeight: geometry.size.height * 0.25)
                .padding([.leading, .trailing], 90)

                
                //Icons
                HStack {
                    //Level Indicator
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 100)
                        Text(String(level))
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
                .frame(maxHeight: geometry.size.height * 0.25)
        
            }
            
        }
        .padding(30)
    }
}

#Preview {
    ZStack {
        Color.blue
        LevelBarView(level: 1, levelXP: 30, playerXP: 20)
    }
}
