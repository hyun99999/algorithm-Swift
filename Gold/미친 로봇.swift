// 통제할 수 없는 로봇이 N번의 행동을 취한다.
// 4개의 방향 중 하나를 임의로 선택하여 이동한다.
// 로봇이 한 곳을 한 번만 이동할 때 이동 경로가 단순하다고 한다.
// 로봇의 이동 경로가 단순할 확률을 구하시오.

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
// n <= 14
let n = input[0], ep = input[1], wp = input[2], sp = input[3], np = input[4]

// O(100^n)
// 브루트포스. 시간초과

let dPercent: [Int] = [ep, wp, sp, np]
let d: [Point] = [(0, -1), (0, 1), (-1, 0), (1, 0)]

// ✅ dfs 백트래킹

typealias Point = (row: Int, col: Int)

var answer: Double = 0
var board: [[Bool]] = Array(repeating: Array(repeating: false, count: 2 * n + 1), count: 2 * n + 1)

func dfs(start: Point, c: Int, cpercent: Double) {
    if c == n {
        answer += cpercent
        return
    }
    
    for i in 0..<d.count {
        let next: Point = (start.row + d[i].row, start.col + d[i].col)
        
        if 0 <= next.row && next.row <= 2 * n + 1 &&
            0 <= next.col && next.col <= 2 * n + 1 {
            if !board[next.row][next.col] {
                board[next.row][next.col] = true
                dfs(start: next, c: c + 1, cpercent: cpercent * Double(dPercent[i]) * 0.01)
                board[next.row][next.col] = false
            }
        }
    }
}

board[n][n] = true
dfs(start: (n, n), c: 0, cpercent: 1)

print(answer)
