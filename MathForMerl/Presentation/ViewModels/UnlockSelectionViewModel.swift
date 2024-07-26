//
//  UnlocksViewModel.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-23.
//

import Foundation

protocol UnlockDelegate: AnyObject {
    func selected(unlock: any UnlockBranchProtocol)
}

class UnlockSelectionViewModel {
    
    var unlockTree: UnlockTree?
    var unlockSelectionDelegate:  any UnlockDelegate
    
    
    init(unlockTree: UnlockTree, unlockSelectionDelegate: any UnlockDelegate) {
        self.unlockTree = unlockTree
        self.unlockSelectionDelegate = unlockSelectionDelegate
    }
    
    func unlockOptions() -> [any UnlockBranchProtocol]? {
        
        //TODO: check the availible unlock options for the 3 with the lowest current levels.
        if let termBranch = unlockTree?.termCountBranch {
            return [termBranch]
        }

        return nil
    }
    
    func selected(unlock: any UnlockBranchProtocol) {
        print("Unlocking \(unlock.displayName)")
        unlockSelectionDelegate.selected(unlock: unlock)
    }
    
}
