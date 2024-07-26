//
//  UnlockCardView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-26.
//

import SwiftUI

struct UnlockCardView: View {
    
    let unlockBranch: any UnlockBranchProtocol
    let selectionAction: (any UnlockBranchProtocol) -> Void
    
    var body: some View {
        
        Button {
            selectionAction(unlockBranch)
        } label: {
            
            ZStack {
                //Card BG
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.2
                    }
                    .containerRelativeFrame(.vertical) { height, axis in
                        height * 0.4
                    }
                    .foregroundColor(Color(white: 0.9))
                
                VStack {
                    Text(unlockBranch.displayName)
                        .fontWeight(.black)
                        .font(.title)
                        .foregroundStyle(.gray)
                    
                    ZStack {
                        Circle()
                            .stroke(.gray, lineWidth: 4)
                            .containerRelativeFrame(.horizontal) { width, axis in
                                width * 0.1
                            }
                        
                        
                        Image(systemName: "lock")
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .containerRelativeFrame(.horizontal) { width, axis in
                width * 0.8
            }
            .containerRelativeFrame(.vertical) { height, axis in
                height * 0.8
            }
            .foregroundColor(Color(white: 0.8))
        
        UnlockCardView(unlockBranch: UnlockBranchTermCount(currentLevel: 2), selectionAction: { player in })
    }
}
