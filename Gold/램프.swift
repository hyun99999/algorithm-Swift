// 스위치를 누를 때마다 열에있는 램프의 상태가 바뀐다.
// k번 스위치를 누를 때 켜져있는 행을 최대로 하려고 한다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
var board: [[Int]] = Array(repeating: [], count: nm[0])

for i in 0..<nm[0] {
    let input: [Int] = readLine()!.map { Int(String($0)) ?? -1 }
    
    board[i] = input
}

let k: Int = Int(readLine()!) ?? 0

var maxRow: Int = 0

// 완전탐색
// 재귀를 통해서 구하니 시간 초과

// ✅ 최적화 조건
// n행의 꺼진 전구의 개수는 k 이하
// n행의 꺼진 개수와 k는 모두 짝수거나 홀수여야 한다.

for row in 0..<nm[0] {
    var offCount: Int = 0
    
    for col in 0..<nm[1] {
        if board[row][col] == 0 {
            offCount += 1
        }
    }
    
    var count: Int = 0
    
    if k >= offCount && offCount % 2 == k % 2 {
        for r in 0..<nm[0] {
            // board[i] 행과 동일하다면
            if board[row] == board[r] {
                count += 1
            }
        }
    }
    maxRow = max(maxRow, count)
}

print(maxRow)

/*
2 2
00
11
999
*/

// 0
