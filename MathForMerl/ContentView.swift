//
//  ContentView.swift
//  MathForMerl
//
//  Created by Erica Sampson on 2024-07-12.
//

import SwiftUI

struct LevelBar: View {
    
    var level: Int
    var levelXP: Int
    var currentXP: Int
    
    var body: some View {
        ZStack {
            
            //Level Bar
            Group {
                //Background
                Rectangle()
                    .fill(.gray)
                    .frame(width:.infinity, height: 40)
                    .border(.black, width: 2)
                HStack {
                    //Current XP
                    Rectangle()
                        .fill(.green)
                        .frame(width:200, height: 40, alignment: .leading)
                        .border(.black, width: 2)
                    Spacer()
                    
                }
            }
            .padding(95)
            
            //Icons
            HStack {
                //Level Indicator
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 100)
                    Text(String(level))
                        .font(.system(size: 70))
                        .foregroundStyle(.blue)
                        .fontWeight(.black)
                }
                
                Spacer()
                
                //Lock Icon
                Rectangle()
                    .fill(.gray)
                    .frame(width:100, height: 100)
                
            }
            
        }
    }
}

struct EquationView: View {
    
    var terms: [Int]
    var answer: Int
    
    var body: some View {
        
        HStack {
            //Need equation sequence instead
            ForEach(terms, id: \.self) { number in
                TermView(term: number)
            }
            
            Text("=")
                .font(.system(size: 70))
                .foregroundStyle(.black)
                .fontWeight(.black)
            
            TermView(term: answer)
            
            
        }
        .padding()
    }
}

struct AnswerOptions: View {
    
    var answerOptions: [Int]
    
    var body: some View {
        
        HStack {
            ForEach(answerOptions, id: \.self) { number in
                TermView(term: number)
            }
            .padding()
        }
    }
}

struct TermView: View {
    
    var term: Int
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width:130, height: 130)
            Text(String(term))
                .font(.system(size: 70))
                .foregroundStyle(.blue)
                .fontWeight(.black)
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
                VStack {
                    
                    LevelBar(level: 1, levelXP: 100, currentXP: 20)
                    Spacer ()
                
                    EquationView(terms: exampleTerms(), answer: 0)
                    Spacer()
                    
                    AnswerOptions(answerOptions: exampleAnswers())
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
