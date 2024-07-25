//
//  Player.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation
 
class Player: Identifiable, Hashable, Codable {
    
    enum CodingKeys: CodingKey {
        case name
        case currentLevel
        case id
        case unlockTree
    }

    let name: String
    let currentLevel: Int
    let id: String
    
    let unlockTree: UnlockTree
    
    init(name: String, currentLevel: Int, id: String = UUID().uuidString, unlockTree: UnlockTree) {
        self.name = name
        self.currentLevel = currentLevel
        self.id = id
        self.unlockTree = unlockTree
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        currentLevel = try container.decode(Int.self, forKey: .currentLevel)
        name = try container.decode(String.self, forKey: .name)
        unlockTree = try container.decode(UnlockTree.self, forKey: .unlockTree)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(currentLevel, forKey: .currentLevel)
        try container.encode(unlockTree, forKey: .unlockTree)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
