// 2차원 세계에 블록이 쌓여있다.
// 비는 충분히 오고 블록에 고이는 빗물의 총량은?

let hw: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

let blocks: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [[Bool]] = Array(repeating: Array(repeating: false, count: hw[1]), count: hw[0])

for col in 0..<blocks.count {
    for row in 0..<blocks[col] {
        board[row][col] = true
    }
}

// 구현

// 첫 번째와 마지막은 고이지 않음.

var answer: Int = 0

for i in 1..<hw[1] - 1 {
    let leftMax: Int = blocks[0..<i].max() ?? 0
    let righMax: Int = blocks[i + 1..<hw[1]].max() ?? 0
    
    let height: Int = min(leftMax, righMax)
    
    if blocks[i] < height {
        answer += height - blocks[i]
    }
}

print(answer)

/*
4 4
3 0 1 4
*/

// 답 5

/*
3 5
0 0 0 2 0
*/

// 답 0
