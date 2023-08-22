//
//  DataLogic.swift
//  War Card Game
//
//  Created by Christian Foulcard on 8/21/23.
//

import Foundation

class DataLogic {
    
    let cards = (2...14).map {"card\($0)"}
    
    /** Randomize the cards */
    func deal(playerCardVar : String, cpuCardVar : String, playerScoreVar: Int, cpuScoreVar: Int) {
        var playerCard = playerCardVar
        var cpuCard = cpuCardVar
        var playerScore = playerScoreVar
        var cpuScore = cpuScoreVar
        playerCard = cards.randomElement() ?? "card2"
        cpuCard = cards.randomElement() ?? "card3"
        
        if getNumericValue(from: playerCard) ?? 0 == getNumericValue(from: cpuCard) ?? 0 {
            print("Draw")
        } else if getNumericValue(from: playerCard) ?? 0 >= getNumericValue(from: cpuCard) ?? 0 {
            playerScore = playerScore + 1
        } else if getNumericValue(from: cpuCard) ?? 0 >= getNumericValue(from: playerCard) ?? 0 {
            cpuScore = cpuScore + 1
        } else {
            print("Draw")
        }
    }
    
    func getNumericValue(from card: String) -> Int? {
        // Extract the numeric portion of the string
        let numericPortion = card.dropFirst(4) // "card" is 4 characters

        // Convert to Int and return
        return Int(numericPortion)
    }
    
    func resetGame(playerCardVar : String, cpuCardVar : String, playerScoreVar: Int, cpuScoreVar: Int) {
        var playerCard = playerCardVar
        var cpuCard = cpuCardVar
        var playerScore = playerScoreVar
        var cpuScore = cpuScoreVar
    playerCard = "back"
    cpuCard = "back"
    playerScore = 0
    cpuScore = 0
    }
}
