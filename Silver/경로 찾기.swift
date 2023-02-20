import Foundation

// 가중치 없는 방향 그래프.
// (i, j)에서 i에서 j로 가는 경로가 있는지 구하시오.
// 정점의 갯수는 100이하.
// 인접 행렬 형식 : 2차원 배열로 그래프의 연결 관계를 표현하는 방식을 의미.

// 모든 노드에서 모든 노드로의 탐색
// 최단 경로가 아닌 갈 수 있는지 유무이기 때문에 DFS
// -> 방문 배열 + 재귀

let input: Int = Int(readLine()!) ?? 0

var graph: [[Int]] = []
var checked: [[String]] = Array(repeating: Array(repeating: "0", count: input), count: input)

for _ in 0..<input {
    graph.append(readLine()!.components(separatedBy: " ").map { Int($0) ?? -1 })
}

// 아이디어: start 마다에서 출발해서 도착할 수 있는 방문배열을 사용.
// 즉, 정점에서 출발해서 도착할 수 있는지만 확인하기 위해 매번 방문배열을 초기화.
var visited: [Bool] = Array(repeating: false, count: input + 1)

for index in 0..<input {
    dfs(index, index)
    
    visited = Array(repeating: false, count: input + 1)
}

func dfs(_ start: Int, _ now: Int) {
    for next in 0..<graph[start].count {
        if !visited[next] && graph[now][next] == 1 {
            visited[next] = true
            checked[start][next] = "1"
            
            dfs(start, next)
        }
    }
}

for row in checked{
    print(row.joined(separator: " "))
}


/*
3
0 1 0
0 0 1
1 0 0
*/

// 결과
/*
1 1 1
1 1 1
1 1 1
*/
