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

enum GameStrat {
    case lose
    case draw
    case win
}

class Game {
    var opponentMove: GameMove
    var playerMove: GameMove
    var playerStrat: GameStrat
    var playerScore: Int = 0

    init() {
        opponentMove = .paper
        playerMove = .paper
        playerStrat = .draw
    }

    func decypherOpponentMove(_ move: String) {
        switch move {
        case "A":
            opponentMove = .rock
        case "B":
            opponentMove = .paper
        default: // "C" - case and onwards...
            opponentMove = .scissors
        }
    }


    func decidePlayerMoveOnStrategy(_ strat: String) {
        switch strat {
        case "X": // lose
            playerStrat = .lose
            switch opponentMove {
            case .rock:
                playerMove = .scissors
            case .paper:
                playerMove = .rock
            case .scissors:
                playerMove = .paper
            }
        case "Y": // draw
            playerStrat = .draw
            playerMove = opponentMove
        default: // win
            playerStrat = .win
            switch opponentMove {
            case .rock:
                playerMove = .paper
            case .paper:
                playerMove = .scissors
            case .scissors:
                playerMove = .rock
            }
        }
    }

    private func addScoreToPlayerBasedOnMove() {
        switch playerMove {
        case .rock:
            playerScore += 1
        case .paper:
            playerScore += 2
        case .scissors:
            playerScore += 3
        }
    }

    func calculateScore() {
        addScoreToPlayerBasedOnMove()
        switch playerStrat {
        case .lose:
            playerScore += 0
        case .draw:
            playerScore += 3
        case .win:
            playerScore += 6
        }
    }

}

func part01(playerMove: String, opponentMove: String) -> Int {
    var playerPoints = 0

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

    return playerPoints
}

func getInput(mock: Bool = false) -> String {
    if mock {
        return Mock.input
    }
    return ReadInput.shared.read()
}

func main() {
    ReadInput.shared.inputFolder = "02"
    let input = getInput()

    var game = Game()

    // A giant tournament of Rock, Paper, Scissors!
    // Rules:
    // Points for move played : 1 for Rock, 2 for Paper and 3 for Scissors
    // Opponent plays: A - Rock, B - Paper, C - Scissors
    // Player plays: X - Rock, Y - Paper, Z - Scissors
    
    // Part 02:
    // New rules for player: X - should lose!, Y - should draw!, Z - should win!
    
    var playerPoints = 0

    for gameSequence in input.split(separator: "\n") {
        //        player.encryptMove = gameSequence.split(separator: " ").last ?? ""
        let playerMove = String(gameSequence.split(separator: " ").last ?? "")
        let opponentMove = String(gameSequence.split(separator: " ").first ?? "")

        game.decypherOpponentMove(opponentMove)
        game.decidePlayerMoveOnStrategy(playerMove)
        game.calculateScore()

        playerPoints += part01(playerMove: playerMove, opponentMove: opponentMove)

    }
    print(">> Player score (part 01): \(playerPoints)") // should show 11449
    print(">> Player score (part 02): \(game.playerScore)")
    print()
}

main()
