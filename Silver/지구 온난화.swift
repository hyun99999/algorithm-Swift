// 지구 온난화가 계속 될 경우 남해의 지도는 어떻게 바뀔까?
// R*C 크기의 지도에서 X땅, .바다
// 50년 후에 인접한 세 칸 혹은 네 칸에 바다가 있는 땅은 모두 잠긴다.
// 50년 후에 섬을 포함하는 가장 작은 직사각형을 출력하시오.

let rc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[String]] = Array(repeating: [], count: rc[0])

typealias Point = (row: Int, col: Int)

for row in 0..<rc[0] {
    let input: [String] = readLine()!.map { String($0) }
    
    board[row] = input
}

var newBoard: [[String]] = board

// 모든 섬을 포함하는 가장 작은 직사각형 만들기
// 아이디어: row, col 의 최댓값, 최솟값을 사용.

var minPoint: Point = (10, 10)
var maxPoint: Point = (0, 0)

func check(_ point: Point) {
    if board[point.row][point.col] == "X" {
        var count: Int = 0
        
        // 상하좌우
        let drow: [Int] = [-1, 1, 0, 0]
        let dcol: [Int] = [0, 0, -1, 1]
        
        for i in 0..<4 {
            let next: Point = (point.row + drow[i], point.col + dcol[i])
            
            if 0 <= next.row && next.row < rc[0] &&
                0 <= next.col && next.col < rc[1] {
                // 🚨 지도의 범위를 벗어나는 칸은 모두 바다이다.
                // 주위의 땅을 세는 것으로 변경.
                if board[next.row][next.col] == "X" {
                    count += 1
                }
            }
        }
         
        if count <= 1 {
            // 바다로 잠김.
            newBoard[point.row][point.col] = "."
        } else {
            // 여전히 땅.
            minPoint.row = min(minPoint.row, point.row)
            minPoint.col = min(minPoint.col, point.col)
            
            maxPoint.row = max(maxPoint.row, point.row)
            maxPoint.col = max(maxPoint.col, point.col)
        }
    }
}

for row in 0..<rc[0] {
    for col in 0..<rc[1] {
        check((row, col))
    }
}

for row in minPoint.row...maxPoint.row {
    print(newBoard[row][minPoint.col...maxPoint.col].joined())
}

/*
5 3
...
.X.
.X.
.X.
...
*/

// 답 X
