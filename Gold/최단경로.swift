import Foundation

// 최단 경로
// 방향 그래프. 주어진 시작점에서 다른 모든 정점으로 최단 경로 구하는 프로그램 작성.
// 간선의 가중치는 10이하의 자연수.

// 아이디어: 시작점에서 이어지는 정점들의 길이를 비교하여 최단 경로 구하기.

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 정점의 개수
let v: Int = input[0]
/// 간선의 개수
let e: Int = input[1]
/// 시작 정점
let start: Int = Int(readLine()!) ?? 0

var queue: [Int] = []
// 메모리 초과!
//var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: v + 1), count: v + 1)
var graph: [[(Int, Int)]] = Array(repeating: [], count: v + 1)
var distances: [Int] = Array(repeating: Int.max, count: v + 1)

for _ in 0..<e {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
    // 주의 : 서로 다른 두 정점 사이에 여러 개의 간선이 존재할 수도 있음.
    graph[input[0]].append((input[1], input[2]))
}

queue.append(start)
distances[start] = 0

while !queue.isEmpty {
    let first: Int = queue.removeFirst()

    for next in graph[first] {
        queue.append(next.0)
        distances[next.0] = min(distances[first] + next.1, distances[next.0])
    }
}

for index in 1...v {
    if distances[index] == Int.max {
        print("INF")
    } else {
        print(distances[index])
    }
}
