//
//  UnlockAttribute.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation
 
class UnlockBranchTermCount: UnlockBranchProtocol, Identifiable, Hashable, Codable {
    
    enum CodingKeys: CodingKey {
        case id
        case currentLevel
    }

    var id = UUID().uuidString
    var currentLevel: Int
    var maxLevel = 5

    var termCount: Int {
        currentLevel + 1
    }
    
    init(currentLevel: Int) {
        self.currentLevel = currentLevel
    }
    
    static func == (lhs: UnlockBranchTermCount, rhs: UnlockBranchTermCount) -> Bool {
        lhs.id == rhs.id
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        currentLevel = try container.decode(Int.self, forKey: .currentLevel)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(currentLevel, forKey: .currentLevel)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func levelUp() {
        currentLevel += 1
    }
}
