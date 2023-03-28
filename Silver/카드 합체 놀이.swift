import Foundation

// 석환은 자연수가 쓰여진 카드 n장을 가진다.
// i번째 카드에는 ai가 쓰여있다. 카드합체하면 노는데 다음과 같다.

// 1.x번 카드와 y번 카드를 골라 그 두 장에 쓰여진 수를 더한 값을 계산한다.(x!=y)
// 2.계산한 값을 x번 카드와 y번 카드 두 장 모두에 덮어 쓴다.

// 카드합체 놀이는 총 m번이면 끝난다. n장의 쓰여있는 수를 모두 더한 값이 놀이의 점수가 된다.
// 점수를 가장 작게 만드는 것이 놀이의 목표이다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let a: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var sortedA: [Int] = a.sorted(by: <)

// 아이디어: a 배열을 오름차순으로 정렬.
// 앞에 두 개를 더하고 다시 정렬을 반복.

for _ in 0..<nm[1] {
    let sum: Int = sortedA[0] + sortedA[1]
    sortedA[0] = sum
    sortedA[1] = sum

    sortedA = sortedA.sorted(by: <)
}

print(sortedA.reduce(0, +))


/*
4 2
4 2 3 1
 
결과
19
*/
