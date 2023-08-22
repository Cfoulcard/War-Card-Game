//
//  ContentView.swift
//  War Card Game
//
//  Created by Christian Foulcard on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard: String = "back"
    @State var cpuCard: String = "back"
    let cards = (2...14).map {"card\($0)"}
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            Image("background-plain").resizable().ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                HStack {
                    Image(playerCard).padding()
                    Image(cpuCard).padding()
                }.padding()
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                HStack(alignment: .center, spacing: 40.0) {
                    Text("Player").padding()
                    Text("CPU").padding()
                }.foregroundColor(.white).fontWeight(.bold)
        
                HStack(alignment: .center, spacing: 40.0) {
                    Text(String(playerScore)).padding()
                    Text(String(cpuScore)).padding()
                }.foregroundColor(.white).fontWeight(.bold).font(.title)
                
                Button(action: {
                    resetGame()
                }) { Text("Reset Game")
                        .frame(width: 150, height: 30)
                        .border(Color.white, width: 1)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                }
            }
            .padding()
            

        }

    }
    
    /** Randomize the cards */
    func deal() {
        playerCard = cards.randomElement() ?? "card2"
        cpuCard = cards.randomElement() ?? "card2"

        let playerCardValue = getNumericValue(from: playerCard) ?? 0
        let cpuCardValue = getNumericValue(from: cpuCard) ?? 0

        if playerCardValue == cpuCardValue {
            print("Draw")
        } else if playerCardValue > cpuCardValue {
            playerScore += 1
        } else {
            cpuScore += 1
        }
    }
    
    func getNumericValue(from card: String) -> Int? {
        // Extract the numeric portion of the string
        let numericPortion = card.dropFirst(4) // "card" is 4 characters

        // Convert to Int and return
        return Int(numericPortion)
    }
    
    func resetGame() {
    playerCard = "back"
    cpuCard = "back"
    playerScore = 0
    cpuScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
