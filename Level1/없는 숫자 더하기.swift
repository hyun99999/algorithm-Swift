//
//  main.swift
//  없는 숫자 더하기
//
//  Created by kimhyungyu on 2022/06/20.
//

import Foundation

/*
func solution(_ numbers:[Int]) -> Int {
    var array: [Int] = Array(repeating: 0, count: 10)
    let sortedNumbers: [Int] = numbers.sorted()
    var result: Int = 0
    
    sortedNumbers.forEach {
        array[$0] = 1
    }
    
    for (index, number) in array.enumerated() {
        if number == 0 {
            result += index
        }
    }
    
    return result
}
*/

func solution(_ numbers:[Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}


let result = solution([1,2,3,4,6,7,8,0])
print(result)
