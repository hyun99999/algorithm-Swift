// n*n 크기에 사탕
// 사탕의 색이 모두 같지 않을 수 있음
// 사탕의 색이 다른 인접한 두 칸을 고름 -> 사탕을 서로 교환.
// 같은 색으로 이루어져 있는 가장 긴 행 또는 열을 고른 다음 다 먹는다.
// 먹을 수 있는 사탕의 최대 개수를 구하시오.

/// 50 이하.
let n: Int = Int(readLine()!) ?? 0

var board: [[String]] = []

for _ in 0..<n {
    let input: [String] = readLine()!.map { String($0) }
    
    board.append(input)
}

// 아이디어: 모든 위치에서 상하좌우로 교환.
// -> 보드를 검사.

func check() -> Int {
    var maxCount: Int = 1
    
    // 행 검사.
    for col in 0..<n {
        var count: Int = 1
        
        for row in 0..<n - 1 {
            if board[row][col] == board[row + 1][col] {
                count += 1
            } else {
                count = 1
            }
            maxCount = max(maxCount, count)
        }
    }
    
    // 열 검사.
    for row in 0..<n {
        var count: Int = 1
        
        for col in 0..<n - 1 {
            if board[row][col] == board[row][col + 1] {
                count += 1
            } else {
                count = 1
            }
            maxCount = max(maxCount, count)
        }
    }
    
    return(maxCount)
}

var answer: Int = 0

// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

for row in 0..<n {
    for col in 0..<n {
        for i in 0..<4 {
            let nrow: Int = row + drow[i]
            let ncol: Int = col + dcol[i]
            
            if 0 <= nrow && nrow < n &&
                0 <= ncol && ncol < n {
                
                if board[row][col] != board[nrow][ncol] {
                    let temp: String = board[row][col]
                    
                    board[row][col] = board[nrow][ncol]
                    board[nrow][ncol] = temp
                    
                    answer = max(answer, check())
                    
                    board[nrow][ncol] = board[row][col]
                    board[row][col] = temp
                }
            }
        }
    }
}

print(answer)

/*
3
CCP
CCP
PPC
*/

// 답: 3


/*
4
PPPP
CYZY
CCPY
PPCC
*/

// 답 : 4
