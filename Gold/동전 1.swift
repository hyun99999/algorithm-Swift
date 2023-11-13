// n가지 동전을 사용해서 가치의 합이 k원이 되게 하고 싶다.
// 경우의 수를 구하시오.
// 중복된 조합은 안됨
// 경우의 수는 최대 2^31 -> Swift 에서 런타임 에러.

import Foundation

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var coins: [Int] = []

for _ in 0..<nk[0] {
    let coin: Int = Int(readLine()!) ?? 0
    
    coins.append(coin)
}

coins.sort()

// dfs. 완전탐색. -> 시간초과
// dp

var dp: [Int] = Array(repeating: 0, count: nk[1] + 1)

// 0원도 하나의 경우
dp[0] = 1

// 🚨 점화식 구하기
// dp[n] = dp[n] + dp[n - 사용한 동전]

for i in 0..<coins.count {
    for j in 1..<nk[1] + 1 {
        if j >= coins[i] {
            if dp[j] + dp[j - coins[i]] <= Int(pow(2.0, 31.0)) {
                dp[j] += dp[j - coins[i]]
            }
        }
    }
}

print(dp[nk[1]])

/*
3 10
1
2
5
*/

// 답: 10
