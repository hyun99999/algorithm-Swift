// n명이서 축구를 하려한다.
// 스타트와 링크 팀으로 나누는데 팀의 인원수는 같지 않아도 되지만 한 명 이상
// Sij 능력치는 i번 사람과 j번 사람이 같은 팀에 속했을 때 팀에 더해지는 능력치
// 능력치의 차이를 최소로 하려고 한다 최솟값 출력.

let n: Int = Int(readLine()!) ?? 0

var board: [[Int]] = Array(repeating: [], count: n)

for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    board[i] = input
}

// 한 명 이상으로 이루어진 팀

var visited: [Bool] = Array(repeating: false, count: n + 1)

func check() -> Int {
    var link: Int = 0
    var start: Int = 0
    
    for i in 0..<n {
        for j in i..<n {
            if visited[i] && visited[j] {
                link += board[i][j] + board[j][i]
            } else if !visited[i] && !visited[j] {
                start += board[i][j] + board[j][i]
            }
        }
    }
    return abs(link - start)
}

var minScore: Int = Int.max

func dfs(start: Int, depth: Int, total: Int) {
    if depth == total {
        minScore = min(check(), minScore)
        return
    }
    
    for next in start + 1..<n {
        visited[next] = true
        dfs(start: next, depth: depth + 1, total: total)
        visited[next] = false
    }
}

// 완전탐색, dfs
// ✅ 1~N-1 으로 한 팀을 꾸린다고 하고 완전 탐색

for i in 1..<n {
    for j in 0..<n {
        visited[j] = true
        dfs(start: j, depth: 1, total: i)
        visited[j] = false
    }
}

print(minScore)

/*
4
0 1 2 3
4 0 5 6
7 1 0 2
3 4 5 0
*/

// 0
