//
//  main.swift
//  biggestNum-CodingTest
//
//  Created by kimhyungyu on 2021/04/08.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    let result = numbers.sorted(by: {Int("\($0)\($1)")! > Int("\($1)\($0)")!} )
    return result[0] == 0 ? "0" : result.reduce(""){ "\($0)" + "\($1)" }
}

let numbers = [6,20,2]
print(solution(numbers))

let numbers2 = [0,0,0,0]
print(solution(numbers2))
