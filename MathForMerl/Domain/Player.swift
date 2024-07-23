//
//  Player.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation

struct Player: Identifiable, Hashable {

    let name: String
    let currentLevel: Int
    let id: String
    
    init(id: String = UUID().uuidString, name: String, currentLevel: Int) {
        self.name = name
        self.currentLevel = currentLevel
        self.id = id
    }

}
