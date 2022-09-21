import Foundation

func solution(_ board:[[Int]]) -> Int {
    // N*N
    // 0:비어있음 1:벽으로 채워있음
    // 직선 도로 100월
    // 코너 500원
    
    let N: Int = board.count
    
    // 상하좌우
//    let dx: [Int] = [-1, 1, 0, 0]
//    let dy: [Int] = [0, 0, -1, 1]
    
    // 상우하좌 으로 바꾸니까 통과되었다.(14번, 24번 실패)
    let dx: [Int] = [-1, 0, 1, 0]
    let dy: [Int] = [0, 1, 0, -1]

    var costBoard: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N), count: N)

    
    // direction 이 달라지면 커브
    func dfs(current row: Int, col: Int, cost: Int, direction: Int) {
        if board[row][col] == 1 || cost > costBoard[row][col] {
            return
        }
        
        costBoard[row][col] = cost
        
        for i in 0..<dx.count {
            if row + dx[i] >= 0 &&
            row + dx[i] < N &&
            col + dy[i] >= 0 &&
            col + dy[i] < N {
                let nx = row + dx[i]
                let ny = col + dy[i]
                
                if direction == i {
                    dfs(current: nx, col: ny, cost: cost + 100, direction: i)
                } else {
                    // 방향이 달라지는 경우 코너 + 직선
                    dfs(current: nx, col: ny, cost: cost + 600, direction: i)
                }
                
            }
        }
    }
    
    costBoard[0][0] = 0
    
    // 출발점에서는 1,0 / 0,1 로만이동 가능.
    dfs(current: 0, col: 1, cost: 100, direction: 1)
    dfs(current: 1, col: 0, cost: 100, direction: 2)
    
    
    return costBoard[N - 1][N - 1]
}

print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
// 3800
