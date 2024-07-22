//
//  OperatorView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import SwiftUI

struct OperatorView: View {
    
    let operatorString:String
    
    var body: some View {
        Text(operatorString)
            .font(.custom("Noteworthy", fixedSize: 70))
            .foregroundStyle(.black)
            .fontWeight(.black)
    }
}

#Preview {
    ZStack {
        Color.blue
        OperatorView(operatorString: "+")
    }
}
