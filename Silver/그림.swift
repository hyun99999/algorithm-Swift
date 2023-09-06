// 도화지에 그림이 그려져 있을 때, 그림의 개수와 넓이가 가장 넓은 것의 넓이를 출력해라.
// 그림은 1로 표현되어 있다.

let rc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = Array(repeating: [], count: rc[0])

for i in 0..<rc[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
}

// MARK: - 입력 끝.

var area: Int = 0
var maxArea: Int = 0
var count: Int = 0

// dfs.
// 재귀 + 방문배열

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: rc[1]), count: rc[0])
typealias Point = (row: Int, col: Int)

let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

func dfs(start: Point) {
    visited[start.row][start.col] = true
    area += 1
    
    for i in 0..<4 {
        let next: Point = (start.row + drow[i], start.col + dcol[i])
        
        if 0 <= next.row && next.row < rc[0] &&
            0 <= next.col && next.col < rc[1] &&
            !visited[next.row][next.col] && board[next.row][next.col] == 1 {
            dfs(start: next)
        }
    }
}

for row in 0..<rc[0] {
    for col in 0..<rc[1] {
        if !visited[row][col] && board[row][col] == 1 {
            count += 1
            area = 0
            dfs(start: (row, col))
            maxArea = max(maxArea, area)
        }
    }
}

print(count)
print(maxArea)

/*
6 5
1 1 0 1 1
0 1 1 0 0
0 0 0 0 0
1 0 1 1 1
0 0 1 1 1
0 0 1 1 1
*/

// 4
// 9
