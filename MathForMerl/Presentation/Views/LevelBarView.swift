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
    var currentXP: Int
    
    var body: some View {
        ZStack {
            
            // TODO: Get rid of magic numbers and make relative to screen size
            
            //Level Bar
            Group {
                //Background
                Rectangle()
                    .fill(.gray)
                    .frame(maxWidth:.infinity, maxHeight: 40)
                    .border(.black, width: 2)
                HStack {
                    //Current XP
                    Rectangle()
                        .fill(.green)
                        .frame(width:200, height: 40, alignment: .leading)
                        .border(.black, width: 2)
                    Spacer()
                    
                }
            }
            .padding(95)
            
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
            
        }
        .padding(30)
    }
}

#Preview {
    LevelBarView(level: 2, levelXP: 30, currentXP: 20)
}
