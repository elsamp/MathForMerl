//
//  MathForMerlApp.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

@main
struct MathForMerlApp: App {
    
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {

            GameView()
        }
        .environmentObject(gameViewModel)
    }
}
