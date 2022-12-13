// ✅ 아이디어 : 최소 신장 트리(신장 트리는 모든 노드가 연결. 사이클이 발생하지 않는 그래프이다.)
// MST(Minimum Spanning Tree). 최소 신장 트리, 최소 스패닝 트리를 찾는 알고리즘은 크게 두 가지 있다.
// 크루스칼 알고리즘
// -> 그래프 간선의 가중치를 오름차순 정렬 후 사이클이 생기는 구간을 제외. 이는 간선의 개수가 노드의 갯수-1 가 될 때까지만 반복.
// -> 이때, 사이클의 유무는 Union-Find 알고리즘을 이용.(연결될 때 부모 노드를 동일하게 변경. 즉, 부모 노드가 같다면 같은 사이클을 만들게 된다고 판단.)
// 프림 알고리즘
// -> 시작 노드를 임의로 정함. 연결된 간선 중 가중치가 적은 간선 연결.
// -> 이때, 사이클이 발생하면 제외.(도착 노드가 연결된 노드 집합에 있다면 사이클 발생.)
// -> 연결된 노드의 집합 갯수가 노드의 갯수가 될 때까지 반복.


import Foundation
/*
// n 개의 섬사이에 다리를 건설하는 비용 cost
// 최소 비용으로 모든 섬이 통행할 수 있도록 만들때 비용은?
// costs[i][0] 와 costs[i][1] 연결되는 섬의 번호
// costs[i][2] 은 cost.
// 연결할 수 없으면 주어지지 않는다.

/// 각 노드의 부모 노드를 두는 배열. 이를 활용해서 사이클이 생성되는지 유무 판단.
var parentArray: [Int] = []

// ✅ 크루스칼 알고리즘 풀이.
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    for number in 0..<n {
        parentArray.append(number)
    }
    
    let sortedCost: [[Int]] = costs.sorted { $0[2] < $1[2] }
    var answer: Int = 0
    
    for bridge in sortedCost {
        if parentArray[bridge[0]] != parentArray[bridge[1]] {
            parentArray.indices.filter { parentArray[$0] == findParent(child: bridge[0]) }.forEach { parentArray[$0] = findParent(child: bridge[1]) }
            answer += bridge[2]
        }
    }
    
    return answer
}

//가장 위 부모 찾기
func findParent(child:Int) -> Int {
    // parrentArray의 child번째가 child라면 가장 위에 있는 부모 노드.
    // 아니면 재귀 호출해서 가장 위에 있는 부모 노드를 반환.
    return parentArray[child] == child ? child : findParent(child:parentArray[child])
}
*/

// 코드 출처: https://fomaios.tistory.com/entry/프로그래머스-섬-연결하기-Swift

// ✅ 프림 알고리즘 풀이
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph: [Int : [(node: Int, cost: Int)]] = [:]
    
    for edge in costs {
        let start: Int = edge[0]
        let end: Int = edge[1]
        let cost: Int = edge[2]
        
        graph[start, default: [(end, cost)]] += [(end, cost)]
        graph[end, default: [(start, cost)]] += [(start, cost)]
    }
    
    return prim(graph, n)
}

func prim(_ graph: [Int : [(node: Int, cost: Int)]], _ n: Int) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var edgeQueue: [(node: Int, cost: Int)] = []
    var minCost: Int = 0
    
    // 임의의 시작 노드를 0으로 지정.
    visited[0] = true
    
    if let start = graph[0] {
        for (node, cost) in start {
            edgeQueue.append((node, cost))
        }
    }
    
    while !edgeQueue.isEmpty {
        edgeQueue.sort { $0.cost < $1.cost }
        
        let min = edgeQueue.removeFirst()
        let cost: Int = min.cost
        let node: Int = min.node
        
        // 방문하지 않은 노드로 연결.
        if !visited[node] {
            visited[node] = true
            minCost += cost
            
            // 연결한 노드의 간선들을 큐에 추가.
            if let next = graph[node] {
                for (node, cost) in next {
                    if !visited[node] {
                        edgeQueue.append((node, cost))
                    }
                }
            }
        }
    }
    
    
    return minCost
}

// 코드 출처: https://velog.io/@kerri/Swift-프로그래머스Lv3-섬-연결하기
