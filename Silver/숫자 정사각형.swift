// n*m 크기의 직사각형
// 각 칸에는 한 자리 숫자가 적혀 있다.
// 꼭짓점에 쓰여 있는 수가 모두 같은 가장 큰 정사각형을 찾으시오.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Int]] = []
var answer: Int = 0

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.map { Int(String($0)) ?? 0 }
    
    board.append(input)
}

var side: Int = min(nm[0], nm[1])

for side in 1...side {
    for row in 0...nm[0] - side {
        for col in 0...nm[1] - side {
            if board[row][col] == board[row + side - 1][col + side - 1] &&
                board[row][col] == board[row + side - 1][col] &&
                board[row][col] == board[row][col + side - 1] {
                answer = max(answer, side)
            }
        }
    }
}

print(answer * answer)

/*
3 5
42101
22100
22101
*/

// 답: 9
