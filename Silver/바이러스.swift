// 한 컴퓨터가 바이러스에 걸리면 컴퓨터 + 네트워크 상 연결된 모든 컴퓨터가 감염
// 1번 컴퓨터가 바이러스에 걸렸다. 감염된 컴퓨터의 수를 출력.
let n: Int = Int(readLine()!) ?? -1
let m: Int = Int(readLine()!) ?? -1

var visited: [Bool] = Array(repeating: false, count: n + 1)
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var count: Int = 0

for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    graph[input[0]].append(input[1])
    // ✅ 연결되어있기 때문에 양방향.
    graph[input[1]].append(input[0])
}

func dfs(_ start: Int) {
    visited[start] = true
    
    for next in graph[start] {
        if !visited[next] {
            count += 1
            dfs(next)
        }
        
    }
}

dfs(1)

print(count)
