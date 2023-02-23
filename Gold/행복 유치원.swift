import Foundation

// n명의 원생들을 키 순서대로 줄세우고 총 k개의 조로 나누려고 한다.
// 각 조에는 최소 한명의 원생. 같은 조에 속한 원생들은 서로 인접하다.
// 조마다 티셔츠를 맞춘다. 티셔츠를 맞추는 비용은 조에서 가장 키가 큰 원생과 작은 원생의 키 차이 만큼.
// 티셔츠 만드는 비용의 합의 최소는?

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 원생의 수
let n: Int = input[0]
/// 조의 개수
let k: Int = input[1]

let heights: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 아이디어: 티셔츠의 비용을 최소화 하려면? 키 차이가 큰 값은 피하면 된다.
// 큰 값을 어떻게 제외할 수 있나? 경계로 여기면 제외할 수 있다.
// k 조. k-1 경계가 존재한다.
// 키 차이가 큰 k-1개를 경계로 여기고 나머지 키 차이를 더한다.

var difference: [Int] = Array(repeating: 0, count: heights.count - 1)

for index in 0..<heights.count - 1 {
    difference[index] = heights[index + 1] - heights[index]
}

difference.sort(by: >)

print(difference[k - 1..<difference.count].reduce(0, +))
