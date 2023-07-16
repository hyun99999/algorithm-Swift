// dfs 와 bfs 탐색 결과를 출력.
// 방문된 점을 순서대로 출력.
// 양방향.

let nmv: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var graph: [[Int]] = Array(repeating: [], count: nmv[0] + 1)

// MARK: - graph 초기화.

for _ in 0..<nmv[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

// 작은 정점부터 방문하도록 정렬.
for i in 0..<graph.count {
    graph[i] = graph[i].sorted(by: <)
}

// MARK: - dfs. 재귀 + 방문배열

/// dfs 탐색하여 들른 노드 저장.
var dfsAnswer: [Int] = []
var dfsVisited: [Bool] = Array(repeating: false, count: nmv[0] + 1)

func dfs(_ start: Int) {
    dfsVisited[start] = true
    dfsAnswer.append(start)
    
    for next in graph[start] {
        if !dfsVisited[next] {
            dfs(next)
        }
    }
}

// MARK: - bfs. queue + while, 방문배열

var bfsVisited: [Bool] = Array(repeating: false, count: nmv[0] + 1)
var queue: [Int] = []
/// bfs 탐색하여 들른 노드 저장.
var bfsAnswer: [Int] = []

func bfs(_ start: Int) {
    queue.append(start)
    bfsAnswer.append(start)
    bfsVisited[start] = true
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        for next in graph[first] {
            if !bfsVisited[next] {
                queue.append(next)
                bfsAnswer.append(next)
                bfsVisited[next] = true
            }
        }
    }
}

dfs(nmv[2])
print(dfsAnswer.map { String($0) }.joined(separator: " "))

bfs(nmv[2])
print(bfsAnswer.map { String($0) }.joined(separator: " "))

/*
 4 5 1
 1 2
 1 3
 1 4
 2 4
 3 4
 */

// 1 2 4 3
// 1 2 3 4
