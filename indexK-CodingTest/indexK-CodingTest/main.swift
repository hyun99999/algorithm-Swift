//
//  main.swift
//  indexK-CodingTest
//
//  Created by kimhyungyu on 2021/04/06.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map{ array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1] }
}

let array = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
print(solution(array, commands))
