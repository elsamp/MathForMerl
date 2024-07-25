//
//  UnlockTree.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-16.
//

import Foundation
 
class UnlockTree: Identifiable, Hashable, Codable {
    
    enum CodingKeys: CodingKey {
        case id
        case termCountBranch
    }
    

    var id: String
    var termCountBranch: UnlockBranchTermCount
    
    init(id: String = UUID().uuidString, termCountBranch: UnlockBranchTermCount) {
        self.id = id
        self.termCountBranch = termCountBranch
    }
    
    init(id: String = UUID().uuidString) {
        self.id = id
        self.termCountBranch = UnlockBranchTermCount(currentLevel: 1)
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        termCountBranch = try container.decode(UnlockBranchTermCount.self, forKey: .termCountBranch)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(termCountBranch, forKey: .termCountBranch)
    }
    
    static func == (lhs: UnlockTree, rhs: UnlockTree) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
