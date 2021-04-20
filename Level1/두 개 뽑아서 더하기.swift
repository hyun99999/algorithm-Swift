//
//  main.swift
//  pick2-CodingTest
//
//  Created by kimhyungyu on 2021/04/11.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var set: Set<Int> = []
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count{
            set.insert(numbers[i]+numbers[j])
        }
    }
    return set.sorted()
}
let a = [2,1,3,4,1]
print(solution(a))
