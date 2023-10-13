import Foundation

// 직사각형 미로에서 탈출하려고 한다.
// 각 칸은 통로 혹은 벽. 통로에는 레버가 있습니다.
// 레버를 당긴 후 문으로 이동하면 됩니다. 레버를 당기지 않아도 문이 있는 칸은 지나갈 수 있습니다.
// 한 칸을 이동하는데 1초가 걸린다. 최대한 미로를 빠르게 빠져나가시오.
// 최소 몇초 걸리는지 구하시오. 탈출할 수 없다면 -1 출력.

func solution(_ maps:[String]) -> Int {
    typealias Point = (row: Int, col: Int)
    let maps: [[String]] = maps.map { $0.map { String($0) } }
    
    var start: Point = (0, 0)
    var lever: Point = (0, 0)
    var end: Point = (0, 0)
    
    for row in 0..<maps.count {
        for col in 0..<maps[0].count {
            if maps[row][col] == "S" {
                start = (row, col)
            }
         
            if maps[row][col] == "E" {
                end = (row, col)
            }
            
            if maps[row][col] == "L" {
                lever = (row, col)
            }
        }
    }
    
    // bfs
    // 가중치가 동일한 1초.
    // 한 노드에서 한 노드로 이동.
    // start -> lever
    // lever -> end
    // 까지 걸린 시간 구하기.
    
    var board: [[Int]] = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
    var answer: Int = 0
    
    // 상하좌우
    let direction: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func bfs(start s: Point) {
        var queue: [Point] = []
        
        board[s.row][s.col] = 0
        queue.append(s)
        
        while !queue.isEmpty {
            let first: Point = queue.removeFirst()
            
            for i in 0..<4 {
                let next: Point = (first.row + direction[i].row, first.col + direction[i].col)
                
                if 0 <= next.row && next.row < maps.count &&
                    0 <= next.col && next.col < maps[0].count {
                    if board[next.row][next.col] == -1 && maps[next.row][next.col] != "X" {
                        queue.append(next)
                        board[next.row][next.col] = board[first.row][first.col] + 1
                    }
                }
            }
        }
    }
        
    bfs(start: start)
    answer += board[lever.row][lever.col]
    
    if board[lever.row][lever.col] == -1 {
        return -1
    }
    
    board = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
    
    bfs(start: lever)
    answer += board[end.row][end.col]
    
    if board[end.row][end.col] == -1 {
        return -1
    }
    
    return answer
}

print(solution(["SOOOL", "XXXXO", "OOOOO", "OXXXX", "OOOOE"]))
// 16

print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))
// -1
