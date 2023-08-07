// n*n 격자판. 칸은 빈 칸이거나 벽.
// 파이프 하나를 옮기려고 한다. 2개 연속된 칸을 차지.
// 파이프는 항산 빈 칸만 차지.
// 파이프는 →, ↘, ↓ 방향으로 밀 수 있다. 이때 45도 회전시킬 수 있다.
// 처음에는 (1, 1)와 (1, 2) 차지.

let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = Array(repeating: [], count: n)

for row in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[row] = input
}
// MARK: - 입력 끝.

// dp 를 활용하여 시간초과 해결.

var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: n), count: n), count: 3)

// dp[0] 가로
// dp[1] 세로
// dp[2] 대각선

dp[0][0][1] = 1
for i in 2..<n {
    if board[0][i] == 0 {
        dp[0][0][i] = dp[0][0][i - 1]
    }
}

for row in 1..<n {
    for col in 1..<n {
        // 대각선.
        if board[row][col] == 0 && board[row][col - 1] == 0 && board[row - 1][col] == 0 {
            dp[2][row][col] = dp[0][row - 1][col - 1] + dp[1][row - 1][col - 1] + dp[2][row - 1][col - 1]
        }
        
        // 가로, 세로.
        if board[row][col] == 0 {
            dp[0][row][col] = dp[0][row][col - 1] + dp[2][row][col - 1]
            dp[1][row][col] = dp[1][row - 1][col] + dp[2][row - 1][col]
        }
    }
}

print(dp[0][n - 1][n - 1] + dp[1][n - 1][n - 1] + dp[2][n - 1][n - 1])

/*
3
0 0 0
0 0 0
0 0 0
*/

// 답: 1

/*
5
0 0 1 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
*/

// 답: 0
