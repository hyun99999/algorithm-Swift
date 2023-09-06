// 보물섬 지도는 육지(L) 바다(W)로 표시되어 있다.
// 한 칸 이동하는데 한 시간이 걸린다.
// 보물은 최단 거리로 이동하는데 있어 가장 먼 육지 두 곳에 묻혀있다.

// 아이디어: 최단거리 구하기. bfs
// 모든 육지에 대해서 가장 먼 육지까지의 최단거리 구하기.

let rc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[String]] = Array(repeating: [], count: rc[0])

for i in 0..<rc[0] {
    let input: [String] = readLine()!.map { String($0) }
    
    board[i] = input
}

// MARK: - 입력끝.

typealias Point = (row: Int, col: Int)

var queue: [Point] = []
var distance: [[Int]] = Array(repeating: Array(repeating: -1, count: rc[1]), count: rc[0])
var answer: Int = 0

let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

func bfs(_ start: Point) {
    queue.append(start)
    distance[start.row][start.col] = 0
    
    while !queue.isEmpty {
        let first: Point = queue.removeFirst()
        
        for i in 0..<4 {
            let next: Point = (first.row + drow[i], first.col + dcol[i])
            
            if 0 <= next.row && next.row < rc[0] &&
                0 <= next.col && next.col < rc[1] &&
                distance[next.row][next.col] == -1 && board[next.row][next.col] == "L" {
                queue.append(next)
                distance[next.row][next.col] = distance[first.row][first.col] + 1
                
                answer = max(answer, distance[next.row][next.col])
            }
        }
    }
}

for row in 0..<rc[0] {
    for col in 0..<rc[1] {
        if board[row][col] == "L" {
            distance = Array(repeating: Array(repeating: -1, count: rc[1]), count: rc[0])
            bfs((row, col))
        }
    }
}

print(answer)

/*
5 7
WLLWWWL
LLLWLLL
LWLWLWW
LWLWLLL
WLLWLWW
*/

// 답: 8
