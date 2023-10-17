// 인접한 모든 자리의 차이가 1인 수를 계단 수라고 한다.
// 길이가 N인 계단 수가 총 몇 개있는지 구해보자.
// 정답을 1000000000 으로 나눈 나머지를 출력한다.

/// 1이상 100이하.
let n: Int = Int(readLine()!) ?? 0

// 0, 9가 나오면 1과 8밖에 못오지만, 나머지는 2가지 경우의 수.
// 이전 수에서 -1, +1
// dp.
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)

dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

// dp[n] 이 제일 앞의 줄.
if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            if j == 0 {
                dp[i][j] = dp[i - 1][1]
            } else if j == 9 {
                dp[i][j] = dp[i - 1][8]
            } else {
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % 1000000000
            }
        }
    }
}

print(dp[n].reduce(0, +) % 1000000000)

// 1
// 답 : 9

// 2
// 답: 17
