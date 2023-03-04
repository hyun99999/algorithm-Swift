import Foundation

// 길이가 n 수열 s.
// s >= 1
// s에서 원하는 위치에 있는 수를 골라 최대k번 삭제할 수 있다.
// 최대k번 원소를 삭제해서 짝수로만 이루어져 있는 연속한 부분 수열 중 가잔 긴 길이를 구하시오.

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
let n: Int = input[0]
let k: Int = input[1]
var array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }

var answer: Int = 0

// 아이디어: 투포인터
// 홀수의 갯수가 k개를 넘어가면 start + 1. k개를 넘어가지 않으면 end - 1.

var kCount: Int = 0
var start: Int = 0
var end: Int = 0

for index in 0..<array.count {
    if array[index] % 2 != 0 {
        // 홀수
        if k > kCount {
            kCount += 1
        } else {
            for j in start..<index {
                if array[j] % 2 != 0 {
                    start += 1
                    
                    break
                } else {
                    start += 1
                }
            }
        }
    }
    
    end = index
    answer = max(answer, end - start + 1 - kCount)
}

print(answer)
