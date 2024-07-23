//
//  UnlockAttributeProtocol.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

protocol UnlockBranchProtocol: Identifiable {
    
    var id: String { get set }
    var currentLevel:Int { get set }
    var maxLevel: Int { get }
    
    //func updated(config: GameConfiguration) -> GameConfiguration
    
}
