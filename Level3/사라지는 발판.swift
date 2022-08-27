import Foundation

// 아이디어 : 완전 탐색, 재귀
func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    let n = board.count
    let m = board[0].count
    let inf = Int.max

    // 게임 종료 조건 1
    // 캐릭터가 주변 4칸으로 이동할 수 없는 경우 패배.
    // 게임 종료 조건 2
    // 플레이어가 같은 발판 위에 있다가 이동할 때 발판이 사라짐. 패배.

    // A 가 먼저 시작.
    // 상하좌우
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    // 처음에는 누가 이길지 모르기 때문에 최선을 다해서 접근.
    // play() 메소드가 짝수를 반환하면 해당 플에이어 패배.
    // 0을 반환하면 더 이상 움직일 발판이 없으므로 해당 턴에서 패배.
    // 홀수일 경우는 해당 플레이어 승리.
    var count: Int = 0
    
    func play(board: [[Int]], turn: Int, aloc: [Int], bloc: [Int]) -> Int {
        var board = board
        // A가 먼저 시작하기 때문.
        let loc = turn == 0 ? aloc : bloc
        
        if board[loc[0]][loc[1]] == 0 {
            return 0
        }
        
        var odd = inf
        var even = -1
        
        // 사라진 발판.
        board[loc[0]][loc[1]] = 0
        for i in 0..<4 {
            let nextX = dx[i] + loc[0]
            let nextY = dy[i] + loc[1]
            
            if nextX >= 0 &&
                nextY >= 0 &&
                nextX < n &&
                nextY < m &&
            board[nextX][nextY] == 1 {
                if turn == 0 {
                    count = 1 + play(board: board, turn: turn + 1, aloc: [nextX, nextY], bloc: bloc)
                } else {
                    count = 1 + play(board: board, turn: turn - 1, aloc: aloc, bloc: [nextX, nextY])
                }
                
                // 지는 경우는 최대한
                // 이기는 경우는 최소한
                if count % 2 == 0 {
                    even = max(even, count)
                } else {
                    odd = min(odd, count)
                }
            }
        }
        // 재귀가 끝나고 다른 탐색을 위해 돌려둠.
        board[loc[0]][loc[1]] = 1
        
        if odd != inf {
            return odd
        }
        if even != -1 {
            return even
        }
        return 0
    }
    
    return play(board: board, turn: 0, aloc: aloc, bloc: bloc)
}

print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 1]], [1, 0], [1, 2]))
// 4

print(solution([[1]], [0, 0], [0, 0]))
// 0
