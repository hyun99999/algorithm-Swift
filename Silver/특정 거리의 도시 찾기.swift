import Foundation

// * 참고 - 백준에서 Swift 입력 시간초과로 해당 코드는 실제로 통과하지 못한다.
// 1부터 N 번까지의 도시와 M 개의 단방향 도로 존재.
// 모든 도로의 거리는 1.
// x에서 x까지의 거리는 0
// x로부터 출발하여 도달할 수 있는 도시 중 최단 거리 K인 모든 도시의 번호를 오름차순으로 출력.

// 아이디어:
// 플루이드 워셜 - 한 지점에서 모든 지점의 최단 거리이기 때문에
// 하지만, 플루이드 워셜 사용하기에는 노드가 너무 많음.
// ->
// BFS - 모든 간선의 가중치는 동일하기 때문에
// queue + while + 방문 배열

// 모든 도시로의 최단 거리를 구하고, K 인 도시만 찾으면 됨.

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }
let nodeCount: Int = input[0]
let distance: Int = input[2]
let start: Int = input[3]

var visited: [Bool] = Array(repeating: false, count: nodeCount + 1)
var distances: [Int] = Array(repeating: Int.max, count: nodeCount + 1)
var queue: [Int] = [start]
// 단방향.
var graph: [[Int]] = Array(repeating: [], count: nodeCount + 1)

for _ in 0..<input[1] {
    let inputs: [Int] = readLine()!.components(separatedBy: " ").map { Int(String($0)) ?? 0 }
    graph[inputs[0]].append(inputs[1])
}

distances[start] = 0
visited[start] = true

while !queue.isEmpty {
    let first: Int = queue.removeFirst()

    for node in graph[first] {
        if !visited[node] {
            distances[node] = distances[first] + 1
            queue.append(node)
            visited[node] = true
        }
    }
}

var answer: [Int] = []

for (index, value) in distances.enumerated() {
    if value == distance {
        answer.append(index)
    }
}

if answer.count == 0 {
    print(-1)
} else {
    answer.forEach { print($0) }
}

/*
 4 4 2 1
 1 2
 1 3
 2 3
 2 4
 */

// 4
