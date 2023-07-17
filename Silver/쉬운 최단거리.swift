// 모든 지점에 대해서 목표지점까지의 거리를 구하시오.
// 갈 수 없는 땅 0
// 갈 수 있는 땅 1
// 목표 지점 2
// 목표지점까지의 거리를 출력할 때, 갈 수 없는 땅은 0. 갈 수 있는 땅인 부분중에 도달할 수 없는 위치는 -1 출력.

typealias Point = (row: Int, col: Int)

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// O(nm) 공간 복잡도.
var board: [[Int]] = Array(repeating: Array(repeating: 0, count: nm[1]), count: nm[0])
var newBoard: [[Int]] = Array(repeating: Array(repeating: -1, count: nm[1]), count: nm[0])

var goal: Point = (0, 0)

for row in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    for col in 0..<input.count {
        board[row][col] = input[col]
        
        if input[col] == 0 {
            newBoard[row][col] = 0
        }
        
        if input[col] == 2 {
            goal = (row, col)
        }
    }
}
// 갈 수 있는 곳은 -1 표시. 없는 곳은 0 표시.

// 상하좌우.
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

// 한 노드에서 다른 노드로 최단 경로 계산.
// 상하좌우로만 움직일 수 있기 때문에(= 가중치 동일) bfs 만 사용 가능.

var queue: [Point] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])

func bfs(_ start: Point) {
    queue.append(start)
    visited[start.row][start.col] = true
    
    while !queue.isEmpty {
        let first: Point = queue.removeFirst()
        
        for i in 0..<4 {
            let next: Point = (first.row + drow[i], first.col + dcol[i])
            
            if nm[0] > next.row && next.row >= 0 &&
                nm[1] > next.col && next.col >= 0 &&
                !visited[next.row][next.col] &&
                newBoard[next.row][next.col] == -1 {
                queue.append(next)
                visited[next.row][next.col] = true
                newBoard[next.row][next.col] = newBoard[first.row][first.col] + 1
            }
        }
    }
}

newBoard[goal.row][goal.col] = 0
bfs(goal)

for row in 0..<nm[0] {
    print(newBoard[row].map { String($0) }.joined(separator: " "))
}

/*
 15 15
 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 0 0 0 0 1
 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 0 1 0 0 0
 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1
 */

/*
 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21
 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
 11 12 13 14 15 16 17 18 19 20 0 0 0 0 25
 12 13 14 15 16 17 18 19 20 21 0 29 28 27 26
 13 14 15 16 17 18 19 20 21 22 0 30 0 0 0
 14 15 16 17 18 19 20 21 22 23 0 31 32 33 34
 */
