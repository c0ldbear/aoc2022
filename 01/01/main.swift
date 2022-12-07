//
//  main.swift
//  aoc20221201
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

func main() {
    print("Starting!\n")
    ReadInput.shared.inputFolder = "01"
    let input = ReadInput.shared.read().split(separator: "\n", omittingEmptySubsequences: false)
    var result = Solution.shared.part01(with: input)
    print("Result for part 01:\n  \(result)")
    
    print("\n")
    result = Solution.shared.part02(with: input)
    print("Result for part 02:\n  \(result)")
    
    print("\nFinito!")
    
}

main()
