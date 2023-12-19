// CCTV에는 다섯 종류
// 감시할 수 있는 방향의 칸 전체를 감시
// 벽을 통과할 수 없고 감시할 수 없는 영역은 사각지대라고 한다

// CCTV는 회전시킬 수 있는데 항상 90도
// 0 빈칸, 1~5CCTV, 6벽

// 사각 지대의 최소 크기 구하기

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

typealias CCTV = (row: Int, col: Int, category: Int)

var board: [[Int]] = Array(repeating: [], count: nm[0])
var cctv: [CCTV] = []

for row in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[row] = input
    
    for col in 0..<nm[1] {
        if 1...5 ~= input[col] {
            cctv.append((row, col, input[col]))
        }
    }
}

// dfs, 백 트래킹

typealias Point = (row: Int, col: Int)

var minArea: Int = Int.max

// 상 하 좌 우
let direction: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let cctvDirection: [[[Int]]] = [
    [],
    [[0], [1], [2], [3]],
    [[2, 3], [0, 1]],
    [[0, 3], [1, 3], [1, 2], [2, 0]],
    [[2, 0, 3], [0, 3, 1], [3, 1, 2], [1, 2, 0]],
    [[0, 1, 2, 3]]
]

func countZero() -> Int {
    var area: Int = 0
    
    for row in 0..<nm[0] {
        for col in 0..<nm[1] {
            if board[row][col] == 0 {
                area += 1
            }
        }
    }
    
    return area
}

func dfs(index: Int) {
    if index == cctv.count {
        minArea = min(minArea, countZero())
        return
    }
    
    for i in 0..<cctvDirection[cctv[index].category].count {
        var changed: [Point] = []
        
        for j in cctvDirection[cctv[index].category][i] {
            var next: Point = (cctv[index].row + direction[j].row,
                               cctv[index].col + direction[j].col)
            
            while true {
                if 0..<nm[0] ~= next.row &&
                    0..<nm[1] ~= next.col {
                    if board[next.row][next.col] != 6 {
                        // 벽 x
                        if board[next.row][next.col] == 0 {
                            board[next.row][next.col] = -1
                            changed.append(next)
                        }
                        next = (next.row + direction[j].row,
                                next.col + direction[j].col)
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
            
        dfs(index: index + 1)
        
        for i in 0..<changed.count {
            board[changed[i].row][changed[i].col] = 0
        }
    }
}

dfs(index: 0)

print(minArea)

/*
4 6
0 0 0 0 0 0
0 0 0 0 0 0
0 0 1 0 6 0
0 0 0 0 0 0
*/

// 20
