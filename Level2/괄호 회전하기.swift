//
//  main.swift
//  test
//
//  Created by kimhyungyu on 2022/07/02.
//

import Foundation

func solution(_ s:String) -> Int {
    let array: [String] = s.map { String($0) }
    var newArray: [String] = array
    let dict: [String : String] = ["}": "{", ")" : "(", "]" : "["]
    var answer: Int = 0
    
    func check(array: [String]) -> Bool {
        var stack: [String] = []
        for i in 0..<array.count {
            if dict.values.contains(array[i]) {
                // 열린 괄호.
                stack.append(array[i])
            } else if stack.count != 0 && stack.last! == dict[array[i]] {
                // 열린 괄호와 올바른 닫힌 괄호.
                stack.removeLast()
            } else {
                stack.append(array[i])
            }
        }
        
        return stack.count == 0 ? true : false
    }
    
    for _ in 0..<array.count {
        newArray = lotation(array: newArray)
        // 올바른 괄호인지 확인
        if check(array: newArray) {
            answer += 1
        }
    }
    return answer
}

// 문자열 회전.
func lotation(array: [String]) -> [String] {
    var newArray = array
    let element = newArray.removeFirst()
    newArray.append(element)
    
    return newArray
}

let result = solution("[](){}")
print(result)
