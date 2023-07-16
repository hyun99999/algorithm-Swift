// 양방향. 연결 요소의 개수를 구하시오.
//

/// 1 <= n <= 1000,
/// 0 <= m <= n*(n-1)/2
/// 정점 N
/// 간선의 개수 M
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var graph: [[Int]] = Array(repeating: [], count: nm[0] + 1)
var visited: [Bool] = Array(repeating: false, count: nm[0] + 1)
var count: Int = 0

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

// dfs

func dfs(_ start: Int) {
    visited[start] = true
    
    for next in graph[start] {
        if !visited[next] {
            dfs(next)
        }
    }
}

for i in 1...nm[0] {
    if !visited[i] {
        count += 1
        dfs(i)
    }
}

print(count)
