import Foundation

// n*m 미로.
// 1은 이동할 수 있는 칸, 0은 불가능.
// (1,1)에서 출발하여 (n,m)의 위치로 이동할 때 지나야 하는 최소의 칸 구하시오.
// 시작 위치와 도착 위치도 포함한다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

var graph: [[Int]] = []
var queue: [(row: Int, col: Int)] = []
var visited: [[Int]] = Array(repeating: Array(repeating: Int.max, count: nm[1]), count: nm[0])

// MARK: - 그래프 생성.

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.map { Int(String($0)) ?? 0 }
    graph.append(input)
}

// MARK: - BFS

func bfs(_ start: (row: Int, col: Int)) {
    queue.append(start)
    visited[start.row][start.col] = 1
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        // 상하좌우 확인.
        for index in 0..<4 {
            let next: (row: Int, col: Int) = (first.row + drow[index], first.col + dcol[index])
            
            if nm[0] > next.row && next.row >= 0 &&
                nm[1] > next.col && next.col >= 0 &&
                graph[next.row][next.col] != 0 {
                // 이동 가능.
                if visited[next.row][next.col] > visited[first.row][first.col] + 1 {
                    // 최단 경로.
                    queue.append(next)
                    visited[next.row][next.col] = visited[first.row][first.col] + 1
                }
            }
        }
    }
}

bfs((0, 0))

print(visited[nm[0] - 1][nm[1] - 1])

/*
 4 6
 101111
 101010
 101011
 111011
 */

// 15
