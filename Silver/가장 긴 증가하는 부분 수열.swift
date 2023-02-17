import Foundation

// 수열이 주어졌을 때 가장 긴 증가하는(오름차순) 부분 수열을 구하시오.

// 아이디어: DP. dp 는 해당 숫자를 포함하는 가장 긴 부분 수열의 길이.
// 점화식
// if array[i] < array[j]
// dp[i] = max(dp[i], dp[j] + 1)

let _: String = readLine()!
let a: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
var dp: [Int] = Array(repeating: 1, count: a.count)

for i in 1..<a.count {
    for j in 0..<i {
        if a[j] < a[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
