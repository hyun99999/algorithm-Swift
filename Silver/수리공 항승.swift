import Foundation

// 파이프의 가장 왼쪽에서 정수만큼 떨어진 거리만 물이 샌다.
// 항승이는 길이가 L인 테이프를 무한히 가지고 있다.
// 항승이는 물을 막을 때, 위치의 좌우 0.5만큼 간격을 줘야 물이 다시는 안샌다고 생각한다.
// 항승이는 이때 테이프를 최소 몇개 필요한가?
// 단, 테이프를 자를 수 없고, 겹쳐서 붙이는 것은 가능하다.

// 아이디어: 좌우 0.5만큼이면 구멍당 1만큼 소모.
// 일단, 붙이면 자를 수 없기 때문에 연속된 경우가 아니면 새로운 테이프가 필요함.

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let l: Int = input[1]

var array: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
array.sort(by: <)

var start: Int = array[0]
var answer: Int = 1

for index in 1..<array.count {
    if start + l <= array[index] {
        // 테이프 범위에 포함되지 않음.
        answer += 1
        start = array[index]
    }
}

print(answer)

/*
 4 2
 결과
 1 2 100 101
 */
