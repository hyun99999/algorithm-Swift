// 2 * n 직사각형을 1*2 와 2*1 타일로 채우는 방법의 수를 구하시오.

let n: Int = Int(readLine()!) ?? 0

// 아이디어: 경우의 수가 늘어나는 것이 피보나치 형태.
// 2*1 = 1
// 2*2 = 2
// 2*3 = 3
// 2*4 = 5
// dp

var dp: [Int] = Array(repeating: 0, count: 1001)

dp[0] = 0
dp[1] = 1
dp[2] = 2

if n >= 3 {
    for i in 3...n {
        dp[i] = (dp[i - 2] + dp[i - 1]) % 10007
    }
}

print(dp[n])

// 2
// 2

// 9
// 5
