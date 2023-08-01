// LCS(최장 공통 부분 수열)

let a: [String] = readLine()!.map { String($0) }
let b: [String] = readLine()!.map { String($0) }

// 2차원 dp
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: a.count + 1), count: b.count + 1)

// 아이디어: 같은 알파벳의 경우, 비교 전의 lcs 값보다 1 더한다.
// 출처: https://myjamong.tistory.com/317

for row in 1..<dp.count {
    for col in 1..<dp[0].count {
        if b[row - 1] == a[col - 1] {
            dp[row][col] = dp[row - 1][col - 1] + 1
        } else {
            // 다른 경우, lcs 증가하지 않으므로 이전 값들 사용.
            dp[row][col] = max(dp[row - 1][col], dp[row][col - 1])
        }
    }
}

print(dp[b.count][a.count])

/*
 ACAYKP
 CAPCAK
 */

// 4
