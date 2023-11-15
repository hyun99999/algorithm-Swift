// 사이클이 없는 무방향 그래프
// 두 노드를 선택해서 양쪽으로 당길 때 가장 길게 늘어나는 경우를 트리의 지름
// -> 트리에 존재하는 두 노드 사이의 가장 긴 경로

let n: Int = Int(readLine()!) ?? 0

var graph: [[(end: Int, value: Int)]] = Array(repeating: [], count: n + 1)

for _ in 0..<n - 1 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let parent: Int = input[0]
    let child: Int = input[1]
    let value: Int = input[2]
    
    graph[parent].append((child, value))
    graph[child].append((parent, value))
}

// 부모노드에서 dfs 사용해서 가장 깊은 단말 노드와 두 번째로 깊은 단말 노드까지의 가중치 구하기
// 백트래킹

var visited: [Bool] = Array(repeating: false, count: n + 1)
var maxIndex: Int = 0
var maxValue: Int = 0

func dfs(start: Int, sum: Int) {
    if maxValue < sum {
        maxIndex = start
        maxValue = sum
    }
    
    for (end, value) in graph[start] {
        if !visited[end] {
            visited[end] = true
            dfs(start: end, sum: sum + value)
            visited[end] = false
        }
    }
}

// 1 부모 노드로부터 먼 노드를 찾는 dfs 진행.

visited[1] = true
dfs(start: 1, sum: 0)

visited = Array(repeating: false, count: n + 1)
maxValue = 0

// 찾은 노드로 부터 가장 먼 노드를 찾는 dfs 진행.

visited[maxIndex] = true
dfs(start: maxIndex, sum: 0)

print(maxValue)

/*
12
1 2 3
1 3 2
2 4 5
3 5 11
3 6 9
4 7 1
4 8 7
5 9 15
5 10 4
6 11 6
6 12 10
*/

// 답 45
