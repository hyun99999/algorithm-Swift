import Foundation

// 제일 왼쪽 도시에서 제일 오른쪽 도시로 이동.
// 인접한 도시 사이의 길이는 다를 수 있따.
// 1km 마다 1리터 사용.
// 도시마다 주유소가 있고 리터당 가격은 다를 수 있다.
// 최소의 비용을 구하시오.

let n: Int = Int(readLine()!) ?? 0
let distances: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
let prices: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }

// 아이디어: 현재 도시전까지의 기준으로 가장 싼 주유소에서 연료를 구입하면 된다.
var answer: Int = 0
var min: Int = prices[0]

for index in 0..<n - 1 {
    if prices[index] < min {
        min = prices[index]
    }
    answer += min * distances[index]
}

print(answer)

/*
입력:
4
2 3 1
5 2 4 1
*/

// 출력
// 18
