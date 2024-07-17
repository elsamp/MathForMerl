//
//  UnlockAttributeProtocol.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

protocol UnlockBranchProtocol {
    
    var currentLevel:Int { get set }
    var maxLevel: Int { get }
    var updateGameConfig: (Int, Int) -> Void { get set }
    
}
