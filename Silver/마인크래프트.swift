// 집을 짓기 위해 땅을 고른다.
// 세로 n 가로 m 크기의 집터. 다음의 작업을 할 수 있다.

// 2초 작업. 좌표 (i,j) 가장 위의 블록을 제거하여 인벤에 넣음.
// 1초 작업. 인벤에서 블록을 꺼내 (i,j) 블록 위에 올린다.

// 최대한 빨리 땅을 골라야 한다. 최소 시간과 땅의 높이 출력.

let nmb: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: nmb[1]), count: nmb[0])
var time: Int = Int.max
var maxHeight: Int = Int.max

for row in 0..<nmb[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    for col in 0..<nmb[1] {
        board[row][col] = input[col]
    }
}

// ✅ 땅의 높이는 256.
// 0부터 256까지 높이를 설정하여 땅고르기를 한다.
// 이를 통해, 답이 여러개인 경우 높이가 자아 높은 경우를 구할 수 있음.

for height in 0...256 {
    /// 땅고르기하는데 필요한 블럭의 수.
    var blockSum: Int = 0
    var timeSum: Int = 0
    
    for row in 0..<nmb[0] {
        for col in 0..<nmb[1] {
            if height > board[row][col] {
                timeSum += 1 * (height - board[row][col])
            } else if height < board[row][col] {
                timeSum += 2 * (board[row][col] - height)
            }
            blockSum += height - board[row][col]
        }
    }
    
    if blockSum <= nmb[2] && time >= timeSum {
        time = timeSum
        maxHeight = height
    }
}

print(time, maxHeight)

/*
3 4 99
0 0 0 0
0 0 0 0
0 0 0 1
*/

// 2 0
