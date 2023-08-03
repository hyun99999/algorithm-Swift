// 모든 자연수는 넷 혹은 그 이하의 제곱수의 합으로 표현할 수 있다.
// 자연수 n이 주어질 때, n을 최소 개수의 제곱수 합으로 표현하는 프로그램 작성하시오.
import Foundation

/// 50,000 이하.
let n: Int = Int(readLine()!) ?? 0

// dp 를 사용.
var dp: [Int] = Array(repeating: 0, count: 50001)

dp[1] = 1

if n > 1 {
    // i 미만의 제곱수(1취급) + dp[i - 제곱수]
    for i in 2...n {
        var minimum: Int = Int.max
        
        for j in 1...Int(sqrt(Double(i))) {
            minimum = min(minimum, dp[i - j * j])
        }
        
        dp[i] = minimum + 1
    }
}

print(dp[n])

// 25
// 답 1

// 26
// 답 2
