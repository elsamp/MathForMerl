//
//  UnlockSelectionBackgroundView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-26.
//

import SwiftUI

struct UnlockSelectionBackgroundView: View {
    var body: some View {
        ZStack {

            //Dark BG Rectangle
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .containerRelativeFrame(.horizontal) { width, axis in
                    width * 0.8
                }
                .containerRelativeFrame(.vertical) { height, axis in
                    height * 0.8
                }
                .foregroundColor(Color(white: 0.7))
                .offset(x:10, y:10)
            
            //Front Rectangle
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .containerRelativeFrame(.horizontal) { width, axis in
                    width * 0.8
                }
                .containerRelativeFrame(.vertical) { height, axis in
                    height * 0.8
                }
                .foregroundColor(Color(white: 0.8))
        }
    }
}

#Preview {
    UnlockSelectionBackgroundView()
}
