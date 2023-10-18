// n/2 명으로 이루어진 스타트 팀과 링크 팀으로 나눈다.
// 1부터 N까지 번호가 배정된다.
// 능력치 s[i][j] 는 i 와 j 번호의 사람이 같은 팀이 되었을 때 더해지는 능력치
// s[i][j] 와 s[j][i] 가 더해지고, 이는 다를 수 있다.
// 팀끼리 능력치 차이를 최소로 하려고 한다.
// 능력치 차이 최솟값을 출력.

// 4이상 20이하
let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = Array(repeating: [], count: n)
var answer: Int = Int.max

for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    board[i] = input
}

// dfs. 백트래킹
// 재귀 + 방문 배열

var visited: [Bool] = Array(repeating: false, count: n)

func dfs(start: Int, count: Int) {
    // 종료 조건.
    if count == n / 2 {
        // 두 팀을 비교.
        var startTeam: Int = 0
        var linkTeam: Int = 0
        
        for i in 0..<n {
            for j in i..<n {
                if visited[i] && visited[j] {
                    startTeam += board[i][j] + board[j][i]
                } else if !visited[i] && !visited[j] {
                    linkTeam += board[i][j] + board[j][i]
                }
            }
        }
        
        answer = min(answer, abs(startTeam - linkTeam))
        return
    }
    
    // 재귀 호출.
    for s in start..<n {
        if !visited[s] {
            visited[s] = true
            dfs(start: s + 1, count: count + 1)
            visited[s] = false
        }
    }
}

dfs(start: 0, count: 0)

print(answer)

/*
6
0 1 2 3 4 5
1 0 2 3 4 5
1 2 0 3 4 5
1 2 3 0 4 5
1 2 3 4 0 5
1 2 3 4 5 0
*/

// 답: 2
