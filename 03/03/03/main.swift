//
//  main.swift
//  03
//
//  Created by Teddy Juhlin-Henricson on 2022-12-07.
//

import Foundation

func getInput(mock: Bool = false) -> String {
    if mock {
        return Mock.input
    }
    return ReadInput.shared.read()
}

func main() {
    print()
    ReadInput.shared.inputFolder = "03"
    let input = getInput()

    var resultItems = [String]()
    let reference_a = Int(Character("a").asciiValue ?? 0) - 1
    let reference_A = Int(Character("A").asciiValue ?? 0) - 1

    for compartment in input.split(separator: "\n") {

        let firstHalf = compartment.dropLast(compartment.count / 2)
        let endHalf = compartment.dropFirst(compartment.count / 2)

        for letter in firstHalf {
            if let result = endHalf.first(where: { $0 == letter }) {
                resultItems.append(String(result))
                break
            }
        }
    }

    // Calculate sum of priorities (TODO: Move to own function)
    var priorityList = [Int]()
    var sum = 0
    for letter in resultItems {
        var value = Int(Character(letter).asciiValue ?? 0)
        if letter >= "a" && letter <= "z" {
            value -= reference_a
        } else if letter >= "A" && letter <= "Z" {
            value -= reference_A
            value += 26
        }

        priorityList.append(value)
        sum += value
    }
    print(priorityList)
    print(">> Sum of Priority: \(sum)")

    print()
}

main()
