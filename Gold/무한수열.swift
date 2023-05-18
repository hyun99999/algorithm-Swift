// 무한 수열
// A0 = 1
// Ai = A⌊i/P⌋ + A⌊i/Q⌋ (i ≥ 1)

// N P Q 가 주어질 때 AN 을 구하는 프로그램 작성

let npq: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (n, p, q): (Int, Int, Int) = (npq[0], npq[1], npq[2])

// dp
// N이 1조. dp 배열을 만들면 시간초과.

// dictionary 사용.
var dp: [Int: Int] = [0 : 1]

func dfs(_ n: Int) -> Int {
    if let value = dp[n] {
        return value
    } else {
        dp[n] = dfs(n / p) + dfs(n / q)
        return dp[n] ?? 0
    }
}

print(dfs(n))
