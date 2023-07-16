// 지역의 높이 정보를 파악하여 비가 내린 후에 잠기지 않는 안전영역이 얼마나 만들어지는 지 조사.
// 일정한 높이 이하의 모든 지점은 물에 잠긴다.
// 안전영역이 최대인 경우를 구하시오.

let n: Int = Int(readLine()!) ?? 0
var board: [[Int]] = Array(repeating: [], count: n)

for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
}

typealias Point = (row: Int, col: Int)

// 상하좌우.
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

var maxCount: Int = 0

// board 의 높이는 1 이상 100 이하.
// 🚨 아무 지역도 물에 잠기지 않을 수 있다. -> 비가 안올 수도 있음.
// 0부터(비가 안옴) 100까지(최대 높이가 100이기 때문에, 모두 잠김)
// 완전탐색 가능.
for height in 0...100 {
    var newVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    var count: Int = 0
    
    // MARK: - dfs
    
    func dfs(_ height: Int, _ start: Point) {
        newVisited[start.row][start.col] = true
        
        for i in 0..<4 {
            let next: Point = (start.row + drow[i], start.col + dcol[i])
            
            if n > next.row && next.row >= 0 &&
                n > next.col && next.col >= 0 &&
                !newVisited[next.row][next.col] {
                // 이동 가능.
                if board[next.row][next.col] > height {
                    // 안전 영역.
                    newVisited[next.row][next.col] = true
                    dfs(height, next)
                }
            }
        }
    }

    for row in 0..<n {
        for col in 0..<n {
            if !newVisited[row][col] && board[row][col] > height {
                count += 1
                dfs(height, (row, col))
            }
        }
    }
    
    maxCount = max(maxCount, count)
}

print(maxCount)

/*
 5
 6 8 2 6 2
 3 2 3 4 6
 6 7 3 3 2
 7 2 5 3 6
 8 9 5 2 7
 */

// 5
