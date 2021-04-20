//
//  main.swift
//  stringSort-CodingTest
//
//  Created by kimhyungyu on 2021/04/20.
//

import Foundation

func solution(_ s:String) -> String {
    return String(s.sorted(by: >))
}

print(solution("Zbcdefg"))
