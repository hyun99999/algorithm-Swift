// 봄버맨은 R*C 격자판에 있다. 각 칸은 비어있거나 폭탄이다.
// 폭탄이 있는 칸은 3초 뒤에 폭발하여 빈칸. 인접한 네 칸 폭발.
// 연쇄반응은 없다.
// 봄버맨은 폭탄 설치 후에 1초 동안 가만히 있음
// 다음 1초 동안 폭탄이 없는 모든 칸에 폭탄 설치
// 1초가 지난 후에 3초 전에 설치된 폭탄이 폭발
// n 초 후의 격자판 상태를 구하려 한다.

// . 빈칸
// o 폭탄

let rcn: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

typealias Point = (row: Int, col:Int)

// 상하좌우
let d: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var board: [[String]] = Array(repeating: Array(repeating: "", count: rcn[1]), count: rcn[0])

for row in 0..<rcn[0] {
    let input = readLine()!.map { String($0) }
    
    for col in 0..<rcn[1] {
        board[row][col] = input[col]
    }
}

// ✅ 폭탄이 폭발할 때 두 가지 형태로 폭발한다.

var secondBoard: [[String]] = Array(repeating: Array(repeating: "O", count: rcn[1]), count: rcn[0])

for row in 0..<rcn[0] {
    for col in 0..<rcn[1] {
        if board[row][col] == "O" {
            secondBoard[row][col] = "."
            
            for i in 0..<d.count {
                let next: Point = (row + d[i].row, col + d[i].col)
                
                if 0 <= next.row && next.row < rcn[0] &&
                    0 <= next.col && next.col < rcn[1] {
                    secondBoard[next.row][next.col] = "."
                }
            }
        }
    }
}

var thirdBoard: [[String]] = Array(repeating: Array(repeating: "O", count: rcn[1]), count: rcn[0])

for row in 0..<rcn[0] {
    for col in 0..<rcn[1] {
        if secondBoard[row][col] == "O" {
            thirdBoard[row][col] = "."
            
            for i in 0..<d.count {
                let next: Point = (row + d[i].row, col + d[i].col)
                
                if 0 <= next.row && next.row < rcn[0] &&
                    0 <= next.col && next.col < rcn[1] {
                    thirdBoard[next.row][next.col] = "."
                }
            }
        }
    }
}

if rcn[2] % 4 == 1 {
    if rcn[2] == 1 {
        // 초기 상태.
        for row in 0..<rcn[0] {
            print(board[row].joined())
        }
    } else {
        for row in 0..<rcn[0] {
            print(thirdBoard[row].joined())
        }
    }
} else if rcn[2] % 2 == 0 {
    // 모든 칸에 폭탄이 설치 됨.
    for _ in 0..<rcn[0] {
        print(Array(repeating: "O", count: rcn[1]).joined())
    }
} else if rcn[2] % 4 == 3 {
    for row in 0..<rcn[0] {
        print(secondBoard[row].joined())
    }
}

/*
3 3 3
OO.
OOO
OOO
*/
/*
6 7 3
.......
...O...
....O..
.......
OO.....
OO.....
*/

/*
답
OOO.OOO
OO...OO
OOO...O
..OO.OO
...OOOO
...OOOO
*/
