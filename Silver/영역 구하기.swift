// mn 크기의 모눈 종이가 있다.
// k개의 직사각형을 그릴 때, 직사각형의 내부를 제외한 몇개의 분리된 영역이 생긴다.
// 분리된 영역의 각각 넓이가 몇인지 구하시오.

/// m: 세로, n: 가로, k:직사각형의 개수
let mnk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: mnk[1]), count: mnk[0])

for _ in 0..<mnk[2] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    for col in input[0]..<input[2] {
        for row in input[1]..<input[3] {
            graph[row][col] = true
        }
    }
}

var answer: [Int] = []

// bfs
// 방문 배열 + queue + while

typealias Point = (row: Int, col: Int)

var queue: [Point] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: mnk[1]), count: mnk[0])

// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

func bfs(_ start: Point) -> Int {
    var count: Int = 1
    
    queue.append(start)
    visited[start.row][start.col] = true

    while !queue.isEmpty {
        let first: Point = queue.removeFirst()
        
        for i in 0..<4 {
            let next: Point = (first.row + drow[i], first.col + dcol[i])
            
            if 0 <= next.row && next.row < mnk[0] &&
                0 <= next.col && next.col < mnk[1] &&
                !graph[next.row][next.col] && !visited[next.row][next.col] {
                queue.append(next)
                visited[next.row][next.col] = true
                count += 1
            }
        }
    }
    
    return count
}

for row in 0..<mnk[0] {
    for col in 0..<mnk[1] {
        if !graph[row][col] && !visited[row][col] {
            answer.append(dfs((row, col)))
        }
    }
}

print(answer.count)
print(answer.sorted(by: <).map { String($0) }.joined(separator: " "))

/*
5 7 3
0 2 4 4
1 1 2 5
4 0 6 2
*/

// 답: 3
// 1 7 13
