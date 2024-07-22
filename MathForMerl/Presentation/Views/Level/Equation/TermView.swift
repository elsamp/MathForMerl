//
//  TermView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import SwiftUI

struct TermView: View {
    
    var term: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(5)
                .frame(width:130, height: 130)
                
            Text(term)
                .font(.custom("Noteworthy", fixedSize: 70))
                .foregroundStyle(.indigo)
                .fontWeight(.black)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue
        TermView(term: "5")
    }
}
