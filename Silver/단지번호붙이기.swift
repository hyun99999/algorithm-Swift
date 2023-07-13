import Foundation

// 1은 집이 있는 곳, 0은 집이없는 곳.
// 연결된 집의 모임인 단지를 정의. 이에 번호를 붙임.
// 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 출력하시오.

typealias Point = (row: Int, col: Int)

/// 5 <= n <=25
let n: Int = Int(readLine()!) ?? 0
// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

var board: [[Int]] = []
/// 단지를 표기.
var count: Int = 0
var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var queue: [Point] = []
/// 단지의 집의 수 배열.
var houseCounts: [Int] = []

// MARK: - board 생성.

for _ in 0..<n {
    let input: [Int] = readLine()!.map { Int(String($0)) ?? -1 }
    board.append(input)
}

// MARK: - BFS

func bfs(_ start: Point) {
    var houseCount: Int = 0
    
    queue.append(start)
    visited[start.row][start.col] = count
    houseCount += 1
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for index in 0..<4 {
            let next: Point = (first.row + drow[index], first.col + dcol[index])
            
            if n > next.row && next.row >= 0 &&
                n > next.col && next.col >= 0 &&
                board[next.row][next.col] == 1 &&
                visited[next.row][next.col] == 0 {
                // 보드 내 && 단지 가능 && 방문x.
                queue.append(next)
                visited[next.row][next.col] = count
                houseCount += 1
            }
        }
    }
    houseCounts.append(houseCount)
}

// MARK: - board 모든 구역을 bfs 로 확인. n 이 25이하이기 때문에 가능.

for row in 0..<n {
    for col in 0..<n {
        if visited[row][col] == 0 && board[row][col] == 1 {
            count += 1
            bfs((row, col))
        }
    }
}

// MARK: - 출력.

// 총 단지 수.
print(count)

// 단지 내의 집의 수를 오름차순.
for count in houseCounts.sorted(by: <) {
    print(count)
}


/*
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000
 */

/*
 3
 7
 8
 9
 */

