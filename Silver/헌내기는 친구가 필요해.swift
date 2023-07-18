// 도연이네 캠퍼스는 N*M 이다.
// 상하좌우로 이동. 벽으로는 못감.
// 캠퍼스에서 도연이가 만날 수 있는 사람의 수를 출력.
// O 빈공간
// X 벽
// I 도연
// P 사람

typealias Point = (row: Int, col: Int)

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[String]] = Array(repeating: Array(repeating: "", count: nm[1]), count: nm[0])
var position: Point = (0, 0)

for row in 0..<nm[0] {
    let input: [String] = readLine()!.map { String($0) }
    
    for col in 0..<input.count {
        board[row][col] = input[col]
        
        if input[col] == "I" {
            position = (row, col)
        }
    }
}

// dfs.
// 전체 노드 탐색.

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])
var count: Int = 0

// 상하좌우.
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

func dfs(_ start: Point) {
    visited[start.row][start.col] = true
    
    for i in 0..<4 {
        let next: Point = (start.row + drow[i], start.col + dcol[i])
        
        if 0 <= next.row && next.row < nm[0] &&
            0 <= next.col && next.col < nm[1] &&
            board[next.row][next.col] != "X" &&
            !visited[next.row][next.col] {
            if board[next.row][next.col] == "P" {
                count += 1
            }
            
            dfs(next)
        }
    }
}

dfs(position)

// 아무도 만나지 못한 경우 TT
print(count == 0 ? "TT" : count)

/*
 3 5
 OOOPO
 OIOOX
 OOOXP
 */

//1
