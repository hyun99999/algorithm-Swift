import Foundation

func solution(_ board: [[Int]]) -> Int {
    var newBoard = board
    var max: Int = 0
    
    // 2중 for문으로 우하단을 감싸는 수들 중 가장 작은 수를 더해준다.
    for row in 1..<board.count {
        for col in 1..<board[0].count {
            if board[row][col] == 1{
                newBoard[row][col] = min(newBoard[row - 1][col - 1], newBoard[row - 1][col], newBoard[row][col - 1]) + 1
                max = max < newBoard[row][col] ? newBoard[row][col] : max
            }
        }
    }
    
    // 행이나 열이 1개인 경우는 따로 처리해준다
    if board.count == 1 || board[0].count == 1 {
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                max = max < newBoard[row][col] ? newBoard[row][col] : max
            }
        }
    }
    
    // 가장 큰 수를 제곱하여 반환해준다
    return max * max
}
