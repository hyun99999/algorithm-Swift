// 오르막 수는 같거나 오름차순이면 된다.
// 수의 길이 n 이 주어질 때 오르막 수를 구하시오.

let n: Int = Int(readLine()!) ?? 0

var answer: Int = 0

// 각 수에는 같거나 큰 경우의 수가 있다.

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 1000 + 1)

dp[1] = Array(repeating: 1, count: 10)

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 9 {
                dp[i][j] = dp[i - 1][j]
            } else {
                for z in j...9 {
                    dp[i][j] += dp[i - 1][z]
                }
                // n 이 1000 인 경우 오버 플로우.
                // 매번 10007 로 나눠서 저장.
                dp[i][j] %= 10007
            }
        }
    }
}

print(dp[n].reduce(0, +) % 10007)

// 1
// 10

// 2
// 55

// 3
// 220
