//
//  MathForMerlApp.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

@main
struct MathForMerlApp: App {
    var body: some Scene {
        WindowGroup {

            ContentView(playerSelectionViewModel: PlayerSelectionViewModel(playerSelection: PlayerSelection()))
        }
    }
}
