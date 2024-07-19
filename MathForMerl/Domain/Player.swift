//
//  Player.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

@Observable
class Player: Identifiable {
    
    let name: String
    var currentXP: Int
    let id = UUID()
    
    init(name: String, currentXP: Int) {
        self.name = name
        self.currentXP = currentXP
    }
    
    
}
