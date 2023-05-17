// 폴리오미노
// 1*1 정사각형을 여러 개 이어서 붙인 도형. 다음을 만족.
// 정사각형은 서로 겹치면 안됨.
// 도형은 모두 연결되어야 함.
// 정사각형의 변끼리 연결되어야 함.

// 테트로미노를 적절히 놓아 칸에 쓰인 수들의 합을 최대로 하는 프로그램 작성.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (n, m) = (nm[0], nm[1])

var board: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var maximum: Int = 0

typealias Point = (row: Int, col: Int)

// 좌 우 상 하
let dRow: [Int] = [0, 0, 1, -1]
let dCol: [Int] = [-1, 1, 0, 0]

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0) ?? 0 })
}

// 아이디어 : ㅜ 모형 빼고 나머지는 한 점에서 4개씩 상하좌우로 탐색한 결과.
// 그래서 n>=4 이었다.
// 아래를 참고.
// https://velog.io/@skyepodium/백준-14500-테트로미노
// DFS 를 활용하여 백트래킹.

// MARK: - 4범위 내의 dfs.

func checkDFS(_ point: Point, _ value: Int, _ direction: Int) {
    let currentValue = board[point.row][point.col]
    
    if direction == 3 {
        maximum = max(maximum, value + currentValue)
        return
    }
    
    for i in 0..<4 {
        let nextPoint: Point = Point(point.row + dRow[i], point.col + dCol[i])
        
        if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
            if !visited[nextPoint.row][nextPoint.col] {
                visited[nextPoint.row][nextPoint.col] = true
                checkDFS(nextPoint, value + currentValue, direction + 1)
                // 방문한 점을 다시 방문하기 위해 탐색이 완료되면 탐색 전의 상태로 되돌려야 함.
                visited[nextPoint.row][nextPoint.col] = false
            }
        }
    }
}

// MARK: - ㅗ dfs

func checkEtc(_ point: Point) {
    // ㅓ, ㅏ
    // 맨 위가 point.
    var nextPoint: Point = Point(point.row + 2, point.col)
    if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
        var maxTemp: Int = 0
        
        maxTemp = board[point.row][point.col] + board[point.row + 1][point.col] + board[point.row + 2][point.col]
        
        // ㅓ
        nextPoint = Point(point.row + 1, point.col - 1)
        if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
            maximum = max(maximum, maxTemp + board[nextPoint.row][nextPoint.col])
        }
        
        // ㅏ
        nextPoint = Point(point.row + 1, point.col + 1)
        if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
            maximum = max(maximum, maxTemp + board[nextPoint.row][nextPoint.col])
        }
    }

    // ㅗ, ㅜ
    // 맨 왼쪽이 point.
    nextPoint = Point(point.row, point.col + 2)
    if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
        var maxTemp: Int = 0

        maxTemp = board[point.row][point.col] + board[point.row][point.col + 1] + board[point.row][point.col + 2]
        
        // ㅗ
        nextPoint = Point(point.row - 1, point.col + 1)
        if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
            maximum = max(maximum, maxTemp + board[nextPoint.row][nextPoint.col])
        }
        
        // ㅜ
        nextPoint = Point(point.row + 1, point.col + 1)
        if 0 <= nextPoint.row && nextPoint.row < n && 0 <= nextPoint.col && nextPoint.col < m {
            maximum = max(maximum, maxTemp + board[nextPoint.row][nextPoint.col])
        }
    }
    
}

for row in 0..<n {
    for col in 0..<m {
        let current: Point = Point(row, col)
        visited[current.row][current.col] = true
        checkDFS(current, 0, 0)
        visited[current.row][current.col] = false
        checkEtc(current)
    }
}

print(maximum)
