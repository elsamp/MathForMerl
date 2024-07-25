//
//  LevelSelection.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-17.
//

import Foundation
import SwiftData

struct Players: Codable {
    let players: [Player]
}

class PlayerSelection {
    
    var playerOptions: [Player]?
    var saveFileURL = URL.documentsDirectory.appending(path: "players.json")
    
    init() {
        
    }
    
    func loadPlayerOptions(){

        if FileManager.default.fileExists(atPath: saveFileURL.relativePath) {
            do {
                print("Save file exists, loading data")
                let data = try Data(contentsOf: saveFileURL)
                let players = try JSONDecoder().decode(Players.self, from: data)
                
                print("loading players: \(players)")
                playerOptions = players.players
                
            } catch {
                print("Failed to load, encountered errors: \(error.localizedDescription)")
                fatalError()
            }
        } else {
            print("No file to load")
            playerOptions = [Player]()
        }

    }
    
    func addNew(player: Player){
        
        if playerOptions?.append(player) == nil {
            playerOptions = [player]
        }
        
        let players = Players(players: playerOptions!)
        if let data = try? JSONEncoder().encode(players) {
            //print(String(decoding: data, as: UTF8.self))
            
            do {
                try data.write(to: saveFileURL, options: [.atomic, .completeFileProtection])
                print("Saving Player")
            } catch {
                print("Error Saving: \(error.localizedDescription)")
            }
        }

    }
    
}
