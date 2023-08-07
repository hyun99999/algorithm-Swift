// 1m^2 의 넓이에 자라는 참외 개수를 헤아린 다음, 비례하여 참외의 총개수를 구할 수 있다.
// 참외밭의 경계 길이를 모두 측정.
// 반 시계방향으로 둘레를 돌면서 지나는 변의 방향과 길이가 주어짐.
// 총 참외의 수를 구하시오.

/// 1m^2 당 참외의 개수.
let k: Int = Int(readLine()!) ?? 0

/// 총 면적.
var area: Int = 0
var board: [[Int]] = []
/// 동서남북
var count: [Int: Int] = [:]

// 육각형.
for _ in 0..<6 {
    // 동1, 서2, 남3, 북4
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    board.append(input)
    
    // 큰 사각형 작은 사각형으로 구분.
    // 큰 사각형을 이루는 변들과 붙어있지 않은 두 변이 작은 사각형으로 굿헝됨.
    
    count[input[0], default: 0] += 1
}

var bigArea: Int = 1
var smallArea: Int = 1

for i in 0..<6 {
    if count[board[i][0], default: 0] == 1 {
        bigArea *= board[i][1]
        
        continue
    }
    
    if board[i][0] == board[(i + 2) % 6][0] {
        smallArea *= board[(i + 1) % 6][1]
    }
}

print((bigArea - smallArea) * k)

/*
7
4 50
2 160
3 30
1 60
3 20
1 100
*/

// 답: 47600
