//
//  main.swift
//  aoc20221201
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

func main() {
    print("Starting!")
    let input = ReadInput.shared.read().split(separator: "\n", omittingEmptySubsequences: false)
    
    var max = -1
    var sum = 0
    for number in input {
        if let num = Int(number) {
            sum += num
        } else {
            if sum > max {
                max = sum
            }
            sum = 0
        }
    }
    
    
    print("Result: \(max)")
    
    print("Finito!")
    
}

main()
