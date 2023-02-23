import Foundation

// 여러 지역 중 하나의 지역에 낙하하여 서바이벌 하는 게임.
// 각 지역에는 아이템들이 몇개씩 존재. 어디로 낙하해서 수색해야 가장 많은 아이템을 얻을 수 있는가?
// 각 지역은 일정한 길이 l(1<= l <= 15)의 길이로 연결되어 있다. 양방향 통행이 가능.
// 낙하한 지역을 중심으로 수색 범위 m(1<= m <= 15) 이내의 모든 지역의 아이템을 습득할 수 있다고 할 때.
// 얻을 수 있는 최대 아이템 개수는?

// 아이디어 : 최단거리를 구하고 수색 범위 내의 아이템 개수 합하기.
// 모든 노드에서 모든 노드로의 최단거리. 가중치가 다름. 지역의 개수 n(1<= n <= 100) -> 플로이드 워셜.
// -> 2차원 방문 배열. 3중 for문
// 가중치 이내의 도달할 수 있는 지역 선정하여 아이템 개수 더하기.

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 지역의 개수
let n: Int = input[0]
/// 수색 범위
let m: Int = input[1]
/// 길의 개수
let r: Int = input[2]
/// 이어진 간선의 가중치
var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
/// 지역별 아이템의 수
var items:[Int] = Array(repeating: 0, count: n + 1)

let itemsInput: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

for index in 0..<itemsInput.count {
    items[index + 1] = itemsInput[index]
}

for _ in 0..<r {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    graph[input[0]][input[1]] = input[2]
    graph[input[1]][input[0]] = input[2]
}

for next in 1...n {
    for start in 1...n {
        for end in 1...n {
            if start == end {
                graph[start][end] = 0
            } else {
                if graph[start][next] != Int.max && graph[next][end] != Int.max {
                    graph[start][end] = min(graph[start][next] + graph[next][end], graph[start][end])
                }
            }
        }
    }
}

var answer: Int = 0

for start in 1...n {
    var value: Int = 0
    
    for index in 1..<graph[start].count {
        if graph[start][index] <= m {
            value += items[index]
        }
    }
    
    answer = max(value, answer)
}

print(answer)
