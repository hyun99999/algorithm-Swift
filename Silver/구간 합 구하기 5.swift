// N*N 표에 대해서 (x1, y1)부터 (x2, y2)까지 합을 구하시오.

typealias Point = (row: Int, col: Int)

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: nm[0] + 1), count: nm[0] + 1)
var answer: [Int] = []

for row in 1...nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    for i in 0..<input.count {
        board[row][i + 1] = input[i]
    }
}

// MARK: - 입력 끝.

// 🚨 시간초과.
// O(n2m). 대충 100,000,000,000.
/*
func sum(_ from: Point, _ to: Point) -> Int{
    var sum: Int = 0
    
    // n <= 1,024
    for row in from.row...to.row {
        for col in from.col...to.col {
            sum += board[row][col]
        }
    }
    
    return sum
}
*/

// ✅ 구간합을 사용.
var newBoard: [[Int]] = board

// 0 0 0 0 0
// 0 1 2 3 4
// 0 2 3 4 5
// 0 3 4 5 6
// 0 4 5 6 7

for row in 0..<nm[0] {
    for col in 0..<nm[0] {
        newBoard[row + 1][col + 1] += newBoard[row][col + 1] + newBoard[row + 1][col] - newBoard[row][col]
    }
}

// 0 0 0 0 0
// 0 1 3  6 10
// 0 3 8 15 24
// 0 6 15 27 42
// 0 10 24 42 64

func sum(_ from: Point, _ to: Point) -> Int {
    return newBoard[to.row][to.col] - newBoard[to.row][from.col - 1] - newBoard[from.row - 1][to.col] + newBoard[from.row - 1][from.col - 1]
}

// m <= 100,000
for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    let from: Point = (input[0], input[1])
    let to: Point = (input[2], input[3])
    
    if from == to {
        answer.append(board[from.row][from.col])
    } else {
        answer.append(sum(from, to))
    }
}

answer.forEach { print($0) }

/*
 4 3
 1 2 3 4
 2 3 4 5
 3 4 5 6
 4 5 6 7
 2 2 3 4
 3 4 3 4
 1 1 4 4
 */

// 27
// 6
// 64
