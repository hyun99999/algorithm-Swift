//
//  main.swift
//  test
//
//  Created by kimhyungyu on 2022/06/29.
//

import Foundation

func solution(_ n:Int) -> Int {
    var result: Int = 0
    
    for i in 1...n {
        if n % i == 1 {
            result = i
            break
        }
    }
    
    return result
}

let result = solution(10)
print(result)
