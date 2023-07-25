// n 줄에 0 이상 9이하의 숫자가 세 개씩 적혀있음
// 첫 줄에서 마지막줄 까지 가려 한다.
// 내려갈 때 바로 아래의 수로 넘어가거나 아래의 수와 붙은 수로만 이동 가능

// 이때 내려가며 얻을 수 있는 최대 점수, 최소 점수는?

let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board.append(input)
}

// MARK: - 입력 끝

// 단계별로 최소, 최대를 저장하기 위해서 dp

// 🚨 메모리 제한이 4mb
// 2차원 배열이 아닌 1차원 배열을 사용?
// 하지 않아도 가능했음.
// dp 의 배열을 재활용하여 슬라이딩 윈도우 테크닉을 사용하여 1차원 배열로도 구현 가능함.
var mindp: [[Int]] = board
var maxdp: [[Int]] = board
//var mindp: [Int] = board[0]
//var maxdp: [Int] = board[0]

for row in 0..<n - 1 {
    mindp[row + 1][0] = min(mindp[row][0], mindp[row][1]) + board[row + 1][0]
    maxdp[row + 1][0] = max(maxdp[row][0], maxdp[row][1]) + board[row + 1][0]
    
    mindp[row + 1][1] = min(min(mindp[row][0], mindp[row][1]), mindp[row][2]) + board[row + 1][1]
    maxdp[row + 1][1] = max(max(maxdp[row][0], maxdp[row][1]), maxdp[row][2]) + board[row + 1][1]
    
    mindp[row + 1][2] = min(mindp[row][1], mindp[row][2]) + board[row + 1][2]
    maxdp[row + 1][2] = max(maxdp[row][1], maxdp[row][2]) + board[row + 1][2]
}

print(maxdp[n - 1].max()!, mindp[n - 1].min()!)

/*
 3
 1 2 3
 4 5 6
 4 9 0
 */

// 18 6
