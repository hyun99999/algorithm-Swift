// - 케빈 베이컨의 6단계 법칙
// 지구에 있는 모든 사람들은 최대 6단계 이내에서 서로 아는 사람으로 연결될 수 있다.

// - 케빈 베이컨 게임
// 임의의 두 사람이 최소 몇 단계 만에 이어질 수 있는지 계산.
// 이 케빈 베이컨의 수가 가장 적은 사람을 찾으려고 한다.
// 모든 사람과 게임을 했을 때 나오는 단계의 합 = 케빈 베이컨의 수.

// 모든 노드에서 모든 노드까지 최단 거리 구하는 문제.
// 케빈 베이컨의 수가 가장 작은 사람을 구하시오.
// 아이디어: 플로이드 워셜

// 친구 수
// 2<=n<=100
// 친구 관계 수. 양방향.
// 1<=m<=5,000
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 단계는 모두를 거쳐서 간다는 가정하에 최대 nm[0] - 1.
var visited: [[Int]] = Array(repeating: Array(repeating: nm[0] - 1, count: nm[0] + 1), count: nm[0] + 1)

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    visited[input[0]][input[1]] = 1
    visited[input[1]][input[0]] = 1
}

// O(n3)
for i in 1...nm[0] {
    for row in 1...nm[0] {
        for col in 1...nm[0] {
            if row != col {
                visited[row][col] = min(visited[row][col], visited[row][i] + visited[i][col])
            }
        }
    }
}

let results: [Int] = visited.map { $0.reduce(0, +) }
var winner: Int = 0
var minimum: Int = Int.max

for i in 1..<results.count {
    // 중복인 경우, 번호가 가장 작은 사람을 출력하기 때문에 미만으로 분기 처리.
    if minimum > results[i] {
        winner = i
        minimum = results[i]
    }
}
print(winner)
