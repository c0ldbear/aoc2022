//
//  part01.swift
//  01
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

class Solution {
    
    static var shared = Solution()
    
    private func sumSections(of input: [String.SubSequence]) -> [Int] {
        var sumSectionsArray = [Int]()
        var sum = 0
        for number in input {
            if let num = Int(number) {
                sum += num
            } else {
                sumSectionsArray.append(sum)
                sum = 0
            }
        }
        return sumSectionsArray
    }
    
    func part01(with input: [String.SubSequence]) -> Int {
        // pick the maximum value
        return sumSections(of: input).sorted(by: { $0 > $1 }).first ?? -1
    }
    
    func part02(with input: [String.SubSequence]) -> Int {
        // pick the sum of top 3
        return sumSections(of: input).sorted(by: {$0 > $1})[0...2].reduce(0, +)
    }
}
