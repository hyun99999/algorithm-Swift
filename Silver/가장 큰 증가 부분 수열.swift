import Foundation

// DP
// 점화식
// j < i
// if numbers[j] < numbers[i]
// dp[i] = max(dp[i], numbers[i] + dp[j])

let num: Int = Int(readLine()!) ?? 0
let numbers: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
var dp: [Int] = numbers

for i in 1..<numbers.count {
    for j in 0..<i {
        if numbers[j] < numbers[i] {
            dp[i] = max(dp[i], numbers[i] + dp[j])
        }
    }
}

print(dp.max() ?? 0)
