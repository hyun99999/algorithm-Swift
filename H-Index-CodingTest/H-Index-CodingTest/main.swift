//
//  main.swift
//  H-Index-CodingTest
//
//  Created by kimhyungyu on 2021/04/09.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    for h in (1...sorted.count).reversed() {
        if sorted[h-1] >= h {
            return h
        }
    }
    return 0
}
let citation = [3, 0, 6, 1, 5]
print(solution(citation))
