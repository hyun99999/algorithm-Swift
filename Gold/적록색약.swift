// 적록색약은 빨간색과 초록색의 차이를 거의 느끼지 못한다.
// N*N 에는 RGB 중 하나가 색칠
// 같은 색상이 상하좌우 인접하면 같은 구역. 적록색약의 경우 RG 는 같은 색상.

let n: Int = Int(readLine()!) ?? 0

var board: [[String]] = Array(repeating: [], count: n)

for i in 0..<n {
    let input: [String] = readLine()!.map { String($0) }
    
    board[i] = input
}

var answer: [Int] = []

// bfs

typealias Point = (row: Int, col: Int)

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var queue: [Point] = []

// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

func bfs(_ start: Point, _ color: String) {
    queue.append(start)
    visited[start.row][start.col] = true
    
    while !queue.isEmpty {
        let first: Point = queue.removeFirst()
        
        for i in 0..<4 {
            let next: Point = (first.row + drow[i], first.col + dcol[i])
            
            if 0 <= next.row && next.row < n &&
                0 <= next.col && next.col < n &&
                !visited[next.row][next.col] &&
                board[next.row][next.col] == color {
                
                queue.append(next)
                visited[next.row][next.col] = true
            }
        }
    }
}

var count = 0

// MARK: - 적록 색약 아님.

for row in 0..<n {
    for col in 0..<n {
        if !visited[row][col] {
            count += 1
            bfs((row, col), board[row][col])
        }
    }
}

answer.append(count)

// MARK: - 적록 색약

count = 0

visited = Array(repeating: Array(repeating: false, count: n), count: n)

for row in 0..<n {
    for col in 0..<n {
        if board[row][col] == "G" {
            board[row][col] = "R"
        }
    }
}

for row in 0..<n {
    for col in 0..<n {
        if !visited[row][col] {
            count += 1
            bfs((row, col), board[row][col])
        }
    }
}

answer.append(count)

print(answer.map { String($0) }.joined(separator: " "))

/*
 5
 RRRBB
 GGBBB
 BBBRR
 BBRRR
 RRRRR
 */

// 4 3
