// 포도주를 시식하려한다. 다음의 규칙이 있다.
// 잔을 고르면 모두 마셔야 하고 원래 위치에 둬야 한다.
// 연속으로 3잔을 마실 수 없다.
// 효주는 최대한 많은 포도주를 맛보려 한다.

let n: Int = Int(readLine()!) ?? 0

var grapes: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
    let input: Int = Int(readLine()!) ?? 0
    grapes[i] = input
}

// dp
// 마시는 위치에 따른 최대로 마실 수 있는 양.

var dp: [Int] = Array(repeating: 0, count: n)

if n <= 1 {
    dp[0] = grapes[0]
} else if n <= 2 {
    dp[1] = grapes[0] + grapes[1]
} else {
    dp[0] = grapes[0]
    dp[1] = dp[0] + grapes[1]
    dp[2] = max(max(dp[1], grapes[0] + grapes[2]), grapes[1] + grapes[2])
    
    // 6 10 13 9 8 1
    
    // o o x o
    // o x o o
    // x o o x
    
    for i in 3..<grapes.count {
        dp[i] = max(max(grapes[i] + dp[i - 2], grapes[i] + dp[i - 3] + grapes[i - 1]), dp[i - 1])
    }
}

print(dp[n - 1])

/*
6
6
10
13
9
8
1
*/

// 33
