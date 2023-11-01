// 8방향으로 이동가능한 나이트.
// 해당 위치로 이동하기 위해 최소 몇번 이동해야하는가?

// bfs
// 방문 유무 + queue

let n: Int = Int(readLine()!) ?? 0

typealias Point = (row: Int, col: Int)

let direction: [Point] = [(-1, -2), (-2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2)]

for _ in 0..<n {
    let l: Int = Int(readLine()!) ?? 0
    let input1: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let current: Point = (input1[0], input1[1])
    let input2: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let end: Point = (input2[0], input2[1])
    
    var queue: [Point] = []
    var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: l), count: l)
    var answer: Int = 0
    
    func bfs() {
        if current == end {
            return
        }
        
        queue.append(current)
        visited[current.row][current.col] = 0
        
        while !queue.isEmpty {
            let first: Point = queue.removeFirst()
            
            for i in 0..<8 {
                let next: Point = (first.row + direction[i].row, first.col + direction[i].col)
                
                if next == end {
                    answer = visited[first.row][first.col] + 1
                    queue = []
                    
                    break
                }
                
                if 0 <= next.row && next.row < l &&
                    0 <= next.col && next.col < l &&
                    visited[next.row][next.col] == -1 {
                    queue.append(next)
                    visited[next.row][next.col] = visited[first.row][first.col] + 1
                }
            }
        }
    }
    
    bfs()
    
    print(answer)
}

/*
3
8
0 0
7 0
100
0 0
30 50
10
1 1
1 1
*/

// 답
// 5
// 28
// 0
