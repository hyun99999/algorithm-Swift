// RGB 거리에는 집이 n개 있다.
// 빨 초 파로 집을 칠해야 한다.
// 1번 집의 색은 2번 집의 색과 달라야 함.
// n번 집의 색은 n-1 번 집의 색과 달라야 함.
// i 번째 집은(2<=i<=n-1) i-1, i+1 집과 색이 달라야 함.
// 모든 집을 칠하는 비용의 최솟값.

// 2<=n<=1,000
let n: Int = Int(readLine()!) ?? 0

var graph: [[Int]] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    graph.append(input)
}

// MARK: - 입력 끝

/*
// dfs 시간초과.
var preColor: Int = 0
var answer: [Int] = []

func dfs(_ start: Int, _ preColor: Int, _ count: Int) {
    if start == n - 1 {
        answer.append(count)
        
        return
    }
    for i in 0..<3 {
        if i != preColor {
            dfs(start + 1, i, count + graph[start + 1][i])
        }
    }
}

for i in 0..<3 {
    dfs(0, i, graph[0][i])
}

print(answer.min()!)
*/

// 단계별로 최소 값을 저장하여 활용하면 시간초과를 피할 수 있다.
// DP

var dp: [[Int]] = Array(repeating: Array(repeating: 1001, count:3), count: n)
var preColor: Int = 0

dp[0] = graph[0]

// 점화식
for row in 1..<n {
    dp[row][0] = min(dp[row - 1][1], dp[row - 1][2]) + graph[row][0]
    dp[row][1] = min(dp[row - 1][0], dp[row - 1][2]) + graph[row][1]
    dp[row][2] = min(dp[row - 1][0], dp[row - 1][1]) + graph[row][2]
}

print(dp[n - 1].min()!)

/*
 3
 26 40 83
 49 60 57
 13 89 99
 */

// 96
