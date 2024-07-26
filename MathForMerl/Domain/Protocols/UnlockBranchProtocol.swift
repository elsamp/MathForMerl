//
//  UnlockAttributeProtocol.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

protocol UnlockBranchProtocol: Identifiable {
    
    var id: String { get }
    var currentLevel:Int { get set }
    var maxLevel: Int { get }
    var displayName: String { get }
    
    func levelUp()
    
}
