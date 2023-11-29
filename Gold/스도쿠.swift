// 스도쿠
// 가로, 세로 1~9 visited
// 3*3 1~9 visited

// 모든 빈 칸이 채워진 최종 모습을 출력
// 빈 칸의 경우 0

import Foundation

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)

typealias Point = (row: Int, col: Int)
var blanks: [Point] = []

for i in 0..<9 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    for j in 0..<9 {
        if input[j] == 0 {
            blanks.append((i, j))
        }
        board[i][j] = input[j]
    }
}

// 세로, 가로, 3*3 블럭을 검사하는 함수.

func checkCol(with col: Int, num: Int) -> Bool {
    for row in 0..<9 {
        if board[row][col] == num {
            return false
        }
    }
    return true
}

func checkRow(with row: Int, num: Int) -> Bool {
    for col in 0..<9 {
        if board[row][col] == num {
            return false
        }
    }
    return true
}

func checkBox(with row: Int, _ col: Int, num: Int) -> Bool {
    // (row, col) 를 가지는 3*3 박스의 시작하는 좌표 구하기
    let startRow: Int = row / 3 * 3
    let startCol: Int = col / 3 * 3
    
    for r in 0..<3 {
        for c in 0..<3 {
            if board[startRow + r][startCol + c] == num {
                return false
            }
        }
    }
    return true
}

// ✅ 백트래킹
// 해당 숫자로 수도쿠가 완성되지 않는 경우 뒤로 돌아오기
func backtracking(index: Int) {
    if index == blanks.count {
        for row in 0..<9 {
            for col in 0..<9 {
                print(board[row][col], terminator: " ")
            }
            print()
        }
        exit(0)
    }

    for num in 1...9 {
        if checkCol(with: blanks[index].col, num: num) &&
            checkRow(with: blanks[index].row, num: num) &&
            checkBox(with: blanks[index].row, blanks[index].col, num: num) {
            board[blanks[index].row][blanks[index].col] = num
            backtracking(index: index + 1)
            board[blanks[index].row][blanks[index].col] = 0
        }
    }
}

backtracking(index: 0)

/*
0 3 5 4 6 9 2 7 8
7 8 2 1 0 5 6 0 9
0 6 0 2 7 8 1 3 5
3 2 1 0 4 6 8 9 7
8 0 4 9 1 3 5 0 6
5 9 6 8 2 0 4 1 3
9 1 7 6 5 2 0 8 0
6 0 3 7 0 1 9 5 2
2 5 8 3 9 4 7 6 0
*/

/*
 1 3 5 4 6 9 2 7 8
 7 8 2 1 3 5 6 4 9
 4 6 9 2 7 8 1 3 5
 3 2 1 5 4 6 8 9 7
 8 7 4 9 1 3 5 2 6
 5 9 6 8 2 7 4 1 3
 9 1 7 6 5 2 3 8 4
 6 4 3 7 8 1 9 5 2
 2 5 8 3 9 4 7 6 1
*/
