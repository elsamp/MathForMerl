//
//  UnlockAttribute.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct UnlockBranchTermCount: UnlockBranchProtocol {
    
    var id = UUID().uuidString
    var currentLevel: Int
    var maxLevel = 5
    
    init(currentLevel: Int) {
        self.currentLevel = currentLevel
    }
    
}
