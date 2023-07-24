// n개의 수가 주어졌을 때 i번째부터 j번째 수까지 합 구하시오.

// 1 ≤ N ≤ 100,000
// 1 ≤ M ≤ 100,000
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

let nList: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var answer: [Int] = []
var dp: [Int] = [0] + nList

// 시간 초과를 우려하여 dp.

for i in 1..<nm[0] {
    dp[i + 1] = nList[i] + dp[i]
}

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

    answer.append(dp[input[1]] - dp[input[0] - 1])
}

answer.forEach { print($0) }
