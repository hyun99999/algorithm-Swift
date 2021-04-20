//
//  main.swift
//  takeCenterCharacter-CodingTest
//
//  Created by kimhyungyu on 2021/04/20.
//

import Foundation

func solution(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        //짝수
        return String(Array(s)[s.count/2 - 1...s.count/2 ])
    } else {
        //홀수
        return String(Array(s)[s.count/2])
    }
}
print(solution("abcd"))
