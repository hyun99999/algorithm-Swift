// n*n 격자판. 칸은 빈 칸이거나 벽.
// 파이프 하나를 옮기려고 한다. 2개 연속된 칸을 차지.
// 파이프는 항산 빈 칸만 차지.
// 파이프는 →, ↘, ↓ 방향으로 밀 수 있다. 이때 45도 회전시킬 수 있다.
// 처음에는 (1, 1)와 (1, 2) 차지.

let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for row in 1...n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    for col in 1...n {
        board[row][col] = input[col - 1]
    }
}
// MARK: - 입력 끝.

typealias Point = (row: Int, col: Int)

var answer: Int = 0

/// 모든 좌표 이동. 가로(0), 가->대각선(1), 세로(2), 세->대각선(3), 대->가로(4), 대->세로(5), 대->대각선(6).
let dstart: [Point] = [(0, 1), (0, 1), (1, 0), (1, 0), (1, 1), (1, 1), (1, 1)]
let dend: [Point] = [(0, 1), (1, 1), (1, 0), (1, 1), (0, 1), (1, 0), (1, 1)]
// 모든 좌표 이동에 대해서 다음에 이동할 수 있는 방향 표시.
//  →, ↘, ↓
/// 가로(0) 은 가로(0), 가->대각선(1) 가능.
/// 세로(2) 은 세로(2), 세->대각선(3) 가능.
/// 대->대(6) 은 모두 대->가로(4), 대->세로(5), 대->대각선(6) 가능.
let direction: [[Int]] = [[0, 1], [4, 5, 6], [2, 3], [4, 5, 6], [0, 1], [2, 3], [4, 5, 6]]

// 아이디어: 현재 방향에 대해서 가능한 방향으로 이동을 시키며 종점에 도착하는지 확인하는 dfs.

/// d: 현재 어떤 방향인지 의미.
func dfs(_ start: Point, _ end: Point, _ d: Int) {
    if end == (n, n) {
        answer += 1
        
        return
    }
    
    for j in direction[d] {
        let nstart: Point = (start.row + dstart[j].row, start.col + dstart[j].col)
        let nend: Point = (end.row + dend[j].row, end.col + dend[j].col)
        
        if 1 <= nend.row && nend.row <= n &&
            1 <= nend.col && nend.col <= n &&
            board[nstart.row][nstart.col] != 1 &&
            board[nend.row][nend.col] != 1 {
            if j == 1 || j == 3 || j == 6 {
                if board[nstart.row + 1][nstart.col] != 1 &&
                    board[nstart.row][nstart.col + 1] != 1 {
                        dfs(nstart, nend, j)
                }
            } else {
                dfs(nstart, nend, j)
            }
        }
    }
}

// 시작은 가로방향.
dfs((1, 1), (1, 2), 0)

print(answer)
