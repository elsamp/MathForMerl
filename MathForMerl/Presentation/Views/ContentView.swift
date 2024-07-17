//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
                VStack {
                    
                    LevelBarView(level: 1, levelXP: 100, currentXP: 20)
                    Spacer ()
                
                    EquationView(terms: exampleTerms(), answer: 0)
                    Spacer()
                    
                    AnswerOptionsView(answerOptions: exampleAnswers())
                        .padding(30)
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
    
    func exampleTerms() -> [Int] {
        return [5,12,6]
    }
    
    func exampleAnswers() -> [Int] {
        return [5,4,6,-5]
    }
}

#Preview {
    ContentView()
}
