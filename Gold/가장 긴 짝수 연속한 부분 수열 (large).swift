import Foundation

// 수열 S 에서 원하는 위치에 있는 수를 골라 최대 K번 삭제.

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
let n: Int = input[0]
let k: Int = input[1]
let s: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }

// 가장 긴 짝수 연속한 부분 수열(small)의 코드도 투포인터로 작성했는데 시간초과 되었다.
// n <= 1,000,000
// k <= 100,000
// n과 k가 훨씬 큰 것이 다른 조건.
// 아래의 코드로 입력을 받는 것이 아닌 위의 코드로 입력받으니 시간초과를 피할 수 있었음.
//let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var answer: Int = 0
var kCount: Int = 0
var start: Int = 0
var end: Int = 0

for index in 0..<s.count {
    if s[index] % 2 != 0 {
        // 홀수
        if k > kCount {
            kCount += 1
        } else {
            for j in start..<index {
                if s[j] % 2 != 0 {
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
