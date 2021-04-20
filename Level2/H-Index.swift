//
//  main.swift
//  H-Index-CodingTest
//
//  Created by kimhyungyu on 2021/04/09.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    for (index, element) in citations.sorted(by: >).enumerated() {
        if index >= element {
            return index
        }
    }
    return citations.count
}
let citation = [3, 0, 6, 1, 5]
print(solution(citation))
