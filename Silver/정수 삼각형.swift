// 맨 위에서부터 아래에 있는 수 중 하나를 선택하여 아래 층으로 탐색할 때 합의 최대가 되는 경로를 구하시오.
// 대각선으로만 이동할 수 있다.
// 삼각형의 크기는 500이하.

let n: Int = Int(readLine()!) ?? 0
var graph: [[Int]] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    graph.append(input)
}

var dp: [[Int]] = graph

// 0,0
// 1,0 1,1
// 2,0 2,1 2,2
// 3,0 3,1 3,2 3,3

for row in 0..<n - 1 {
    for col in 0...row {
        // 왼쪽 경로
        if col == 0 {
            dp[row + 1][col] += dp[row][col]
        } else {
            dp[row + 1][col] = max(graph[row + 1][col] + dp[row][col], dp[row + 1][col])
        }
        
        // 오른쪽 경로
        if col == row {
            dp[row + 1][col + 1] += dp[row][col]
        } else {
            dp[row + 1][col + 1] = max(graph[row + 1][col + 1] + dp[row][col], dp[row + 1][col + 1])
        }
    }
}

print(dp[n - 1].max()!)
