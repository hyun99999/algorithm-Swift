// 토마토(7576)
// 토마토(7569)다른 점 :
// 보관 후 하루가 지나면, 익지 않은 토마토들이 익은 토마토의 영향으로 익게 된다.
// 인접한 곳은 위 아래 왼 오 앞 뒤
// 창고에 보관된 토마토들이 며칠이 지나면 다 익게 되는지 최소 일수를 알고 싶다.

// bfs
// 3차원

let mn: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (col, row) = (mn[0], mn[1])

var board: [[Int]] = Array(repeating: [], count: row)

// 가장 밑부터.
for r in 0..<row {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[r] = input
}

// 1 익음
// 0 익지않음
// -1 들어있지 않음

// MARK: - 입력 끝.

typealias Point = (row: Int, col: Int)

// 상하좌우.
let direction: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var queue: [Point] = []

// ✅ bfs + 깊이세기.
// 토마토는 하루에 인접한 것만 익힌다.

func bfs() {
    var index: Int = 0
    
    while index < queue.count {
//    while !queue.isEmpty {
        // 🚨 removFisrt() O(n) 시간 초과.
//        let first: Point = queue.removeFirst()
        let first: Point = queue[index]
        
        for i in 0..<4 {
            let next: Point = (first.row + direction[i].row, first.col + direction[i].col)
            if 0 <= next.row && next.row < row &&
                0 <= next.col && next.col < col &&
                board[next.row][next.col] == 0 {
                queue.append(next)
                // ✅ 인접한 토마토가 시작한 토마토의 일수를 가짐.
                board[next.row][next.col] = board[first.row][first.col] + 1
            }
        }
        index += 1
    }
}

// MARK: - 탐색 전

// 모든 익은 토마토 queue 에 넣기.
for r in 0..<row {
    for c in 0..<col {
        if board[r][c] == 1 {
            queue.append((r, c))
        }
    }
}

bfs()

// MARK: - 탐색 후

var isAvailable: Bool = true
var maxCount: Int = 0

for r in 0..<row {
    for c in 0..<col {
        if board[r][c] == 0 {
            isAvailable = false
            break
        }
        maxCount = max(maxCount, board[r][c])
    }
}

// MARK: - 출력

// 처음부터 익어있다면 0
// 모두 익지 못한다면 -1
// 최소 며칠걸리는지 출력.

if isAvailable {
    // 🚨 토마토가 1부터 시작했기 때문.
    print(maxCount - 1)
} else {
    print(-1)
}

/*
 6 4
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 */

// 8
