//
//  main.swift
//  02 - AOC 2022
//
//  Created by Teddy Juhlin-Henricson on 2022-12-04.
//

import Foundation

enum GameMove {
    case rock
    case paper
    case scissors
    
    
}

class Player {
    var encryptMove: String = ""
    var decryptMove: GameMove? {
        return decrypt()
    }
    var score = 0
    
    private func decrypt() -> GameMove? {
        switch encryptMove {
        case "X":
            return .rock
        case "Y":
            return .paper
        case "Z":
            return .scissors
        default:
            return nil
        }
    }
    
    private func increaseScoreOnMove() {
        switch decryptMove {
        case .rock:
            score += 1
        case .paper:
            score += 2
        case .scissors:
            score += 3
        default:
            score += 0
        }
    }
    
}

func main() {
    //    let input = Mock.input
    let input = ReadInput.shared.read()
    
    // A giant tournament of Rock, Paper, Scissors!
    // Rules:
    // Points for move played : 1 for Rock, 2 for Paper and 3 for Scissors
    // Opponent plays: A - Rock, B - Paper, C - Scissors
    // Player plays: X - Rock, Y - Paper, Z - Scissors
    
    var playerPoints = 0
    //    var player = Player()
    
    for gameSequence in input.split(separator: "\n") {
        //        player.encryptMove = gameSequence.split(separator: " ").last ?? ""
        let playerMove = gameSequence.split(separator: " ").last ?? ""
        let opponentMove = gameSequence.split(separator: " ").first ?? ""
        
        // Count points for move
        switch playerMove {
        case "X":
            playerPoints += 1
        case "Y":
            playerPoints += 2
        case "Z":
            playerPoints += 3
        default:
            playerPoints += 0
        }
        
        // Decide who won or draw (lost - 0, draw - 3, won - 6)
        if (playerMove == "X" && opponentMove == "A")
            || (playerMove == "Y" && opponentMove == "B")
            || (playerMove == "Z" && opponentMove == "C") { // Draw
            playerPoints += 3
        } else if (playerMove == "X" && opponentMove == "B")
                    || (playerMove == "Y" && opponentMove == "C")
                    || (playerMove == "Z" && opponentMove == "A") { // Lost
            playerPoints += 0
        } else if (playerMove == "X" && opponentMove == "C")
                    || (playerMove == "Y" && opponentMove == "A")
                    || (playerMove == "Z" && opponentMove == "B") { // Won
            playerPoints += 6
        }
        
    }
    print("Player score: \(playerPoints)")
}

main()
