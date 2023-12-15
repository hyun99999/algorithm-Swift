// 각 단어는 알파벳의 대문자로만 이루어짐
// 알파벳 대문자를 0부터9 숫자로 바꿔서 합하는 문제
// 같은 알파벳은 같은 숫자로.
// 수의 합을 최대로 만드시오.

import Foundation

let n: Int = Int(readLine()!) ?? 0

var dictionary: [String: Int] = [:]

for _ in 0..<n {
    let input: [String] = readLine()!.map { String($0) }
    
    for i in 0..<input.count {
        dictionary[input[i], default: 0] += Int(pow(10, Float(input.count - i - 1)))
    }
}

// ABB
// BBB
// ->
// A:100
// B:122

// 그리디

let list: [Int] = dictionary.values.sorted(by: >)

var num: Int = 9
var sum: Int = 0

for i in 0..<list.count {
    sum += list[i] * num
    num -= 1
}

print(sum)

/*
2
GCF
ACDEB
*/

// 답 : 99437
