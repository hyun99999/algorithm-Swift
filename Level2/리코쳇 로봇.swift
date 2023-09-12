import Foundation

// 시작 위치에서 목표위치까지 최소 몇 번만에 도달할 수 있는가?
// 방향을 선택해서 장애물, 끝에 부딪힐 때까지 미끄러져 이동
// . 빈공간
// R 로봇의 처음 위치
// D 장애물
func solution(_ board:[String]) -> Int {
    var boards: [[String]] = Array(repeating: Array(repeating: "", count: board[0].count), count: board.count)
    
    typealias Point = (row: Int, col: Int)
    var start: Point = (0, 0)
    var end: Point = (0, 0)
    
    for row in 0..<board.count {
        let input: [String] = board[row].map { String($0) }
        
        for col in 0..<input.count {
            boards[row][col] = input[col]
            
            if boards[row][col] == "R" {
                start = (row, col)
            }
            if boards[row][col] == "G" {
                end = (row, col)
            }
        }
    }
    
    // 한 노드에서 모든 노드.
    // depth 를 기억해야함 -> 최단 거리 배열필요.
    var queue: [Point] = []
    var distances: [[Int]] = Array(repeating: Array(repeating: Int.max, count: board[0].count), count: board.count)
    
    let drow: [Int] = [-1, 1, 0, 0]
    let dcol: [Int] = [0, 0, -1, 1]

    func bfs(_ s: Point) {
        queue.append(s)
        distances[s.row][s.col] = 0
        
        while !queue.isEmpty {
            let first: Point = queue.removeFirst()
            
            if first == end {
                break
            }
            
            for i in 0..<4 {
                var next: Point = (first.row + drow[i], first.col + dcol[i])
                
                while true {
                    if 0 <= next.row && next.row < boards.count &&
                        0 <= next.col && next.col < boards[0].count &&
                        boards[next.row][next.col] != "D" {
                        next = (next.row + drow[i], next.col + dcol[i])
                    } else {
                        next = (next.row - drow[i], next.col - dcol[i])
                        break
                    }
                }
                
                
                if distances[next.row][next.col] == Int.max {
                    distances[next.row][next.col] = distances[first.row][first.col] + 1
                    queue.append((next.row, next.col))
                }
            }
        }
    }
    
    bfs(start)
    
    return distances[end.row][end.col] == Int.max ? -1 : distances[end.row][end.col]
}

print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))
// 7
