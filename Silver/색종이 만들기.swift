// 정사각형 칸들로 이루어진 모양의 종이는 하약색, 파란색으로 칠해져 있다.
// 전체 종이가 모두 같은 색이 아니라면 4등분해서 나눈다.
// 이를 반복하여 하얀색, 파란색으로 칠해지거나 더 이상 자를 수 없을때까지 반복.

// 잘라진 하얀색 색종이와 파란색 색종이의 개수를 구하시오.

// 분할정복 + 재귀

let n: Int = Int(readLine()!) ?? 0

// 0 하양
// 1 파랑

var board: [[Int]] = Array(repeating: [], count: n)

for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[i] = input
}

// MARK: - 입력끝

var whiteCount: Int = 0
var blueCount: Int = 0

typealias Point = (row: Int, col: Int)

func cut(_ start: Point, _ size: Int) {
    var white: Int = 0
    var blue: Int = 0
    
    // ✅ 아이디어:
    // 분할한 영역의 하양, 파랑 갯수 세서 종료 조건 판단.
    for row in start.row..<start.row + size {
        for col in start.col..<start.col + size {
            if board[row][col] == 0 {
                 white += 1
            } else {
                blue += 1
            }
        }
    }
    
    // 종료 조건.
    if white == size * size {
        whiteCount += 1
        
        return
    }
    
    if blue == size * size {
        blueCount += 1
        
        return
    }
        
    // 1
    cut((start.row, start.col), size / 2)
    // 2
    cut((start.row, start.col + size / 2), size / 2)
    // 3
    cut((start.row + size / 2, start.col), size / 2)
    // 4
    cut((start.row + size / 2, start.col + size / 2), size / 2)
}

cut((0, 0), n)

print(whiteCount)
print(blueCount)

/*
8
1 1 0 0 0 0 1 1
1 1 0 0 0 0 1 1
0 0 0 0 1 1 0 0
0 0 0 0 1 1 0 0
1 0 0 0 1 1 1 1
0 1 0 0 1 1 1 1
0 0 1 1 1 1 1 1
0 0 1 1 1 1 1 1
*/

// 9
// 7
