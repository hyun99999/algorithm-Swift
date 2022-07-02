//
//  main.swift
//  test
//
//  Created by kimhyungyu on 2022/07/02.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { cacluateMinNumber(n: $0)}
}

func makeDecimalToBinary(_ decimal: Int64) -> String {
    return "0" + String(decimal, radix: 2)
}

func makeBinaryToDeciaml(_ binary: String) -> Int64 {
    return Int64(binary, radix: 2)!
}

func cacluateMinNumber(n: Int64) -> Int64 {
    var nBinary: [String] = makeDecimalToBinary(n).map { String($0) }
    
    for i in 0..<nBinary.count {
        if nBinary[nBinary.count - (i+1)] == "0" {
            nBinary[nBinary.count - (i+1)] = "1"
            if i != 0 {
                nBinary[nBinary.count - i] = "0"
            }
            break
        }
    }
    
    return makeBinaryToDeciaml(nBinary.joined())
}

let result = solution([7])
print(result)
