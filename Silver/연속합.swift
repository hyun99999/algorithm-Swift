import Foundation

// 임의의 수열이 주어짐. 연속된 몇 개의 수를 선택하여 구할 수 있는 가장 큰 합을 출력하시오.

let num: Int = Int(readLine()!) ?? 0
let numbers: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }

// 아이디어: DP
// 점화식
// dp[i] = max(dp[i], dp[i] + dp[i - 1])

var dp: [Int] = Array(repeating: 0, count: num)

dp[0] = numbers[0]

for i in 1..<numbers.count {
    dp[i] = max(numbers[i], dp[i - 1] + numbers[i])
}

print(dp.max() ?? 0)
