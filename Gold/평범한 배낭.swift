// n 개의 물건. 각 물건은 무게 w, 가치 v,
// 준서는 최대 k만큼 넣을 수 있음.
// 배낭에 넣을 수 있는 물건들의 최대 가치를 구하시오.

// 0-1 knapsack
// 2차원 dp

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nk[1] + 1), count: nk[0] + 1)
var stuffes: [(w: Int, v: Int)] = [(0, 0)]

for _ in 0..<nk[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    stuffes.append((input[0], input[1]))
}

// MARK: - 입력 끝.

for row in 1..<nk[0] + 1 {
    for col in 1..<nk[1] + 1 {
        // row: 물품의 개수.
        // col: 배낭의 무게.
        if col < stuffes[row].w {
            dp[row][col] = dp[row - 1][col]
        } else {
            // 점화식.
            dp[row][col] = max(dp[row - 1][col - stuffes[row].w] + stuffes[row].v, dp[row - 1][col])
        }
    }
}

print(dp[nk[0]][nk[1]])

/*
 4 7
 6 13
 4 8
 3 6
 5 12
 */

//14
