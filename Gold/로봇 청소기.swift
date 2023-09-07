// 청소하는 영역의 개수를 구하시오.
// 방은 n*m 이다. 각각의 칸은 벽 또는 빈 칸.
// 로봇 청소기는 동서남북을 바라본다.
// 1.현재 칸이 청소되지 않은 경우 청소.
// 2.주변 4칸 중 청소되지 않은 빈 칸이 없는 경우
// 2-1.바라보는 방향을 유지하여 한 칸 후진
// 2-2.후진할 수 없다면 작동을 멈춤.
// 3.4칸 중 청소되지 않은 빈 칸이 있는 경우.
// 3-1.반시계 방향으로 90도 회전.
// 3-2.바라보는 방향 기준으로 청소되지 않으면 한 칸  전진.

// 로봇 청소기가 동작하고, 멈출때까지 청소하는 칸의 개수를 출력.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// (r,c) 로봇청소기가 위치. d 방향.
let rcd: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = Array(repeating: [], count: nm[0])

for i in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    // 0청소x 1벽.
    board[i] = input
}

// MARK: - 입력 끝.

typealias Point = (row: Int, col: Int)

/// 0북 1동 2남 3서
var direction: Int = rcd[2]
var currentPosition: Point = (rcd[0], rcd[1])
var stop: Bool = false
var count: Int = 0

/// 반시계 90도 회전.
func turn() {
    if direction == 0 {
        direction = 3
    } else {
        direction -= 1
    }
}

// 북동남서
let drow: [Int] = [-1, 0, 1, 0]
let dcol: [Int] = [0, 1, 0, -1]

func check() {
    if board[currentPosition.row][currentPosition.col] == 0 {
        // 청소
        board[currentPosition.row][currentPosition.col] = 2
        count += 1
    }
    
    var isAvailable: Bool = false
    
    for i in 0..<4 {
        let next: Point = (currentPosition.row + drow[i], currentPosition.col + dcol[i])
        
        if 0 <= next.row && next.row < nm[0] &&
            0 <= next.col && next.col < nm[1] &&
            board[next.row][next.col] == 0 {
            isAvailable = true
            
            break
        }
    }
    
    if !isAvailable {
        // 4칸 중 청소 안된 빈 칸이 없음.
        if board[currentPosition.row - drow[direction]][currentPosition.col - dcol[direction]] == 1 {
            stop = true
        } else {
            currentPosition = (currentPosition.row - drow[direction], currentPosition.col - dcol[direction])
        }
    } else {
        // 4칸 중 청소 안된 빈 칸이 있음.
        turn()
        
        if board[currentPosition.row + drow[direction]][currentPosition.col + dcol[direction]] == 0 {
            currentPosition = (currentPosition.row + drow[direction], currentPosition.col + dcol[direction])
        }
    }
}

while !stop {
    check()
}

print(count)


/*
3 3
1 1 0
1 1 1
1 0 1
1 1 1
*/

// 1
