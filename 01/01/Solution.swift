//
//  part01.swift
//  01
//
//  Created by Teddy Juhlin-Henricson on 2022-12-01.
//

import Foundation

class Solution {
    
    static var shared = Solution()
    
    func part01(with input: [String.SubSequence]) -> Int {
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
        
        return max
    
    }
    
    func part02(with input: [String.SubSequence]) -> Int {
        var maxArray = [Int]()
        var sum = 0
        for number in input {
            if let num = Int(number) {
                sum += num
            } else {
                maxArray.append(sum)
                sum = 0
            }
        }
        
        // pick the sum of top 3
        return maxArray.sorted(by: {$0 > $1})[0...2].reduce(0, +)
    }
}
