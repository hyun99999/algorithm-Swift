import Foundation

// 내구도가 0이하가 되면 파괴.
// skill [type, r1, c1, r2, c2, degree]
// type 1공격 / 2회복
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    // 아이디어 : 완전탐색 시에 시간 초과.
    // 누적합을 사용
    // n: 변화 / type 에 따라 부호.
    // n -> (x1, y1), (x2+1, y2+1)
    // -n -> (x1, y2+1), (x2+1, y1)
    
    var board = board
    var newBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    var answer: Int = 0
    
    for skill in skill {
        let x1 = skill[1]
        let y1 = skill[2]
        let x2 = skill[3]
        let y2 = skill[4]
        var degree = 0
        
        if skill[0] == 1 {
            // 공격
            degree -= skill[5]
        } else {
            // 회복
            degree += skill[5]
        }
        
        // 누적합을 위한 설정.
        newBoard[x1][y1] += degree
        newBoard[x2 + 1][y2 + 1] += degree
        newBoard[x1][y2 + 1] -= degree
        newBoard[x2 + 1][y1] -= degree
    }
    
    // 누적합 진행.(왼->오)
    for row in 0..<newBoard.count {
        for col in 1..<newBoard[0].count {
            newBoard[row][col] += newBoard[row][col - 1]
        }
    }
    
    // 누적합 진행.(위->아래)
    for col in 0..<newBoard[0].count {
        for row in 1..<newBoard.count {
            newBoard[row][col] += newBoard[row - 1][col]
        }
    }
    
    // 초기 보드와 새로운 보드 더하기.
    for row in board.indices {
        for col in board[0].indices {
            board[row][col] += newBoard[row][col]
        }
    }

    // 파괴된 건물 탐색.
    for row in board.indices {
        for col in board[0].indices {
            answer += board[row][col] <= 0 ? 0 : 1
        }
    }
    
    return answer
}

print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
// 10

print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
// 6
