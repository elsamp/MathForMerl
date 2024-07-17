//
//  UnlockAttribute.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct UnlockBranchTermCount: UnlockBranchProtocol {
    
    var currentLevel: Int
    var maxLevel: Int
    var updateGameConfig: (Int, Int) -> Void
    
    
}
