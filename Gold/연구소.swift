// 바이러스의 확산을 막기 위해 연구소에 벽을 세우려고 한다.
// n*m 연구소에 바이러스가 존재하며 상하좌우로 빈 칸에 퍼질 수 있다.
// 새롭게 세울 수 있는 벽의 개수 3개
// 바이러스가 퍼질 수 없는 곳을 안전영역이라고 한다.
// 안전 영역의 최대값을 구하시오.
// 0 빈칸 1 벽 2 바이러스

// dfs
// 모든 곳에 벽을 세워서 최대값을 구해보자

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = []

typealias Point = (row: Int, col:Int)

var virus: [Point] = []
var spaces: [Point] = []

for row in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    for col in 0..<input.count {
        if input[col] == 2 {
            virus.append((row, col))
        }
        if input[col] == 0 {
            spaces.append((row, col))
        }
    }
    board.append(input)
}

var maxCount: Int = 0

let d: [Point] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func dfs(count: Int, index: Int, board: [[Int]]) {
    var safeArea: Int = 0
    var board: [[Int]] = board
    
    if count == 3 {
        // 바이러스 확산.
        var queue: [Point] = virus
        
        while !queue.isEmpty {
            let first: Point = queue.removeFirst()
            
            for j in 0..<4 {
                let next: Point = (first.row + d[j].row, first.col + d[j].col)
                
                if 0 <= next.row && next.row < nm[0] &&
                    0 <= next.col && next.col < nm[1] &&
                    board[next.row][next.col] == 0 {
                    queue.append(next)
                    board[next.row][next.col] = 2
                }
            }
        }

        // 안전 영역 계산.
        for row in 0..<nm[0] {
            for col in 0..<nm[1] {
                if board[row][col] == 0 {
                    safeArea += 1
                }
            }
        }
        maxCount = max(maxCount, safeArea)
        return
    }
    
    for i in index + 1..<spaces.count {
        board[spaces[i].row][spaces[i].col] = 1
        
        dfs(count: count + 1, index: i, board: board)
        
        board[spaces[i].row][spaces[i].col] = 0
    }
}

for i in 0..<spaces.count - 2 {
    board[spaces[i].row][spaces[i].col] = 1
    
    dfs(count: 1, index: i, board: board)
    
    board[spaces[i].row][spaces[i].col] = 0
}

print(maxCount)
