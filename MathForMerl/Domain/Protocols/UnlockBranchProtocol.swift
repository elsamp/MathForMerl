//
//  UnlockAttributeProtocol.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

protocol UnlockAttributeProtocol {
    
    var currentLevel:Int { get set }
    var maxLevel: Int { get set }
    var updateGameConfig: (Int, Int) -> Void { get set }
    
}
