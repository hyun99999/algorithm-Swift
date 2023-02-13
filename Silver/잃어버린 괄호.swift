import Foundation

// 괄호를 적절히 쳐서 값을 최소로 만드시오.
// 양수와 +, - 를 가진 수식.

// 아이디어: - 가 나온 숫자부터 다음 - 까지 계산을 먼저한다.

var minus = readLine()!.components(separatedBy: "-")
var answer: Int = 0

for index in 0..<minus.count {
    let num = minus[index].components(separatedBy: "+").map { Int($0) ?? 0}.reduce(0, +)
    
    if index == 0 {
        answer = num
    } else {
        answer -= num
    }
}

print(answer)

/*
55-50+40
*/

// -35
