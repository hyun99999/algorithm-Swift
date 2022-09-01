func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    // 블록이 2*2 로 붙어있을 경우 사라지면서 점수를 얻음.
    // 사라질때는 한번에 지워짐.
    // A부터Z까지 row는 n, col은 m
    
    // board[][].0 은 알파벳, board[][].1 은 삭제표시.
    var board: [[(block: String, removed: Bool)]] = board.map { $0.map { (String($0), false) } }
    var isMove: Bool = true
    
    // (row, col) 제자리, 우, 하, 대각선을 쉽게 지정하기 위함.
    let d: [(Int, Int)] = [(0, 0), (0, 1), (1, 0), (1, 1)]
    
    // 삭제해야할 블럭 삭제.
    func remove() {
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col].removed {
                    board[row][col] = ("0", true)
                }
            }
        }
        isMove = false
        move()
    }
    
    // 삭제된 부분으로 블럭이 이동.
    func move() {
        for row in 0..<board.count - 1 {
            for col in 0..<board[0].count {
                if board[row][col].block != "0" && board[row + 1][col].block == "0" {
                    isMove = true
                    // 삭제된 부분과 바로 위 블럭을 교체.
                    for i in (1...row + 1).reversed() {
                        board[i][col] = board[i - 1][col]
                        board[i - 1][col] = ("0", true)
                    }
                }
            }
        }
    }
    
    while isMove {
        for row in 0..<board.count - 1 {
            for col in 0..<board[0].count - 1 {
                // ✅ (row, col) 가 항상 좌상단으로 위치하여 확인.
                if board[row + 1][col].block == board[row][col].block &&
                    board[row][col + 1].block == board[row][col].block &&
                    board[row + 1][col + 1].block == board[row][col].block &&
                    board[row][col].block != "0" {
                    for (i, j) in d {
                        board[row + i][col + j].removed = true
                    }
                }
            }
        }
        remove()
    }
    
    return board.flatMap { $0 }.filter { $0.removed }.count
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
// 14
