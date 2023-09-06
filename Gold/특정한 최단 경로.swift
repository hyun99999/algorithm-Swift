// 방향성이 없는 그래프.
// 1번부터 N번까지 최단 거리로 이동하려고 한다.
// 두 정점을 반드시 통과하면 이동하려 한다.
// 한 번 지난 정정, 간선 모두 이동 가능.

let ne: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

typealias Destination = (destination: Int, cost: Int)

var graph: [[Destination]] = Array(repeating: [], count: ne[0] + 1)

for _ in 0..<ne[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    // 양방향
    graph[input[0]].append((input[1], input[2]))
    graph[input[1]].append((input[0], input[2]))
}

let v: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var answer: Int = -1

// 🚨
// 1 -> v1 -> v2 -> n
// 1 -> v2 -> v1 -> n

// 한 노드에서 모든 노드로의 최단 거리 계산. 가중치가 다름.
// 단계마다 방문하지 않은 노드 중에서 최단 거리 노드 찾기. -> v1, v2 에 대해서 지정해서 거리 계산.
// 다익스트라.
// while + queue + 최단거리를 저장하는 배열.

var queue: [Int] = []
var distances: [Int] = Array(repeating: Int.max, count: ne[0] + 1)

func distance(_ start: Int) {
    queue.append(start)
    distances[start] = 0
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        for next in graph[first] {
            if next.cost + distances[first] < distances[next.destination] {
                queue.append(next.destination)
                distances[next.destination] = next.cost + distances[first]
            }
        }
    }
}

// 1에서 시작.
distance(1)

var s2v0: Int = 0
s2v0 += distances[v[0]]

var s2v1: Int = 0
s2v1 += distances[v[1]]

distances = Array(repeating: Int.max, count: ne[0] + 1)
// v[0]에서 시작.
distance(v[0])

var v02v1: Int = 0
v02v1 = distances[v[1]]

var v02n: Int = 0
v02n = distances[ne[0]]

distances = Array(repeating: Int.max, count: ne[0] + 1)
// v[1]에서 시작.
distance(v[1])

var v12n: Int = 0
v12n = distances[ne[0]]

if s2v0 == Int.max || s2v1 == Int.max || v02v1 == Int.max || v02n == Int.max || v12n == Int.max {
    answer = -1
} else {
    answer = min(s2v0 + v02v1 + v12n, s2v1 + v02v1 + v02n)
}

print(answer)


/*
4 6
1 2 3
2 3 3
3 4 1
1 3 5
2 4 5
1 4 4
2 3
*/

// 7
