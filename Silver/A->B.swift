import Foundation

// 정수 A 를 B 로 바꾼다.
// 2를 곱한다.
// 1을 수의 가장 오른쪽에 추가한다.
// A 를 B 로 바꿀 때 필요한 연산의 최소 횟수에 1을 더한 값을 출력.

var answer: Int = 0
let numbers: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
let a: Int = numbers[0]
var b: Int = numbers[1]

// b 의 계산을 되돌리다가 a 보다 작아질 수 있다. 이때는 불가능.
while a != b {
    if a > b {
        answer = -1
        
        break
    }
    
    if b % 2 == 0 {
        // 2로 나눈다.
        b /= 2
        answer += 1
        
        continue
    }
    
    if b % 10 == 1 {
        // 우측에서 1제외.
        b /= 10
        answer += 1
        
        continue
    }

    if b % 10 != 1 {
        // 만들 수 없다.
        answer = -1
        
        break
    }
}

print(answer == -1 ? -1 : answer + 1)

/*
2 162
*/

// 5
