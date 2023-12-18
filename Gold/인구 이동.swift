// n*n 땅이 있고, 각각의 땅에는 나라가 존재
// A[r][c] 명이 살고 있다.
// 인구 이동이 다음과 같이 진행 더이상 이동이 없을 때까지 지속된다
// 인근 두 나라의 인구 차이가 L명 이상, R명 이하라면 하루 동안 국경선을 연다
// 열어야 하는 국경선이 모두 열리면 인구 이동 시작
// 하루 동안 연합 -> 연합을 이루는 각 칸의 인구수는 (연합 인구수) / (연합을 이루고 있는 칸의 개수)
// 연합해체하고 모든 국경선을 닫는다.

// 며칠 동안 인구 이동이 발생하는가

let nlr: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = Array(repeating: [], count: nlr[0])

for i in 0..<nlr[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
}

// bfs

typealias Point = (row: Int, col: Int)

let d: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var queue: [Point] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: nlr[0]), count: nlr[0])
var isAvailable: Bool = true
var answer: Int = 0

func bfs(start: Point) {
    var union: [Point] = [start]
    var sum: Int = board[start.row][start.col]
    
    queue.append(start)
    visited[start.row][start.col] = true
    
    while !queue.isEmpty {
        let first: Point = queue.removeLast()
        
        for i in 0..<d.count {
            let next: Point = (first.row + d[i].row, first.col + d[i].col)
            
            if 0 <= next.row && next.row < nlr[0] &&
                0 <= next.col && next.col < nlr[0] {
                if !visited[next.row][next.col] &&
                    nlr[1] <= abs(board[first.row][first.col] - board[next.row][next.col]) &&
                    abs(board[first.row][first.col] - board[next.row][next.col]) <= nlr[2] {
                    visited[next.row][next.col] = true
                    queue.append(next)
                    union.append(next)
                    sum += board[next.row][next.col]
                    isAvailable = true
                }
            }
        }
    }
    
    // start 국가와의 연합국들 인구 이동
    _ = union.map { point in
        board[point.row][point.col] = sum / union.count
    }
}

while isAvailable {
    isAvailable = false
    visited = Array(repeating: Array(repeating: false, count: nlr[0]), count: nlr[0])
    
    for row in 0..<nlr[0] {
        for col in 0..<nlr[0] {
            if !visited[row][col] {
                bfs(start: (row, col))
            }
        }
    }
    
    if isAvailable {
        answer += 1
    }
}

print(answer)

/*
3 5 10
10 15 20
20 30 25
40 22 10
*/

// 2
