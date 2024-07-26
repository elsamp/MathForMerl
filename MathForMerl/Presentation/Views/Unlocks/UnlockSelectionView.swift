//
//  UnlockSelectionView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-22.
//

import SwiftUI

struct UnlockSelectionView: View {
    
    var viewModel: UnlockSelectionViewModel
    
    var body: some View {
        ZStack {
            UnlockSelectionBackgroundView()
            VStack {
                Text("Level Complete!")
                    .font(.largeTitle)
                Text("Let's make things a little harder. Choose what you want.")
                
                if let unlockOptions = viewModel.unlockOptions() {
                    ForEach(unlockOptions, id: \.id) { unlockBranch in
                        UnlockCardView(unlockBranch: unlockBranch, selectionAction: viewModel.selected(unlock:))
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        UnlockSelectionView(viewModel: UnlockSelectionViewModel(unlockTree: UnlockTree(), unlockSelectionDelegate: PreviewUnlockDelegate()))
    }
}
