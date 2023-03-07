import Foundation

// 1번 발전소에서 n번 발전소로 가는 중간의 전선이 끊겼다.
// 현재 주어진 전선과 발전소의 위치가 주어질 때 최소의 전선 길이를 추가로 사용하여 1번 발전소와 n번 발전소를여녈하는 것이다.
// 두 발전소 사이의 전선의 길이가 m을 초과할 수 없다.
let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 발전소의 수.
let n: Int = input[0]
/// 전선의 수.
let w: Int = input[1]
/// 제한 길이.
let m: Double = Double(readLine()!) ?? 0.0

// 발전소 위치 초기화.
var position: [(x: Int, y: Int)] = [(0, 0)]
for _ in 0..<n {
    let inputs: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    position.append((inputs[0], inputs[1]))
}

/// 1번 발전소로부터의 거리.
var distances: [Double] = Array(repeating: Double(Int.max), count: n + 1)

// 아이디어: 최단 거리 구하기. 한 곳에서 한 곳으로 연결. 간선의 가중치 다름.
// 다익스트라. 한 곳에서 모든 곳. 가중치 다름. 방문하지 않은 노드 중에 최단 거리. 방문 거리 배열 + queue + while.
// ✅ 좋은 문제. 노드에 대해서 간선의 가중치와 도착점을 알려주는 graph를 제공하는 것이 아닌 문제를 통해서 만들게 함.

func distanceFrom(_ from: (x: Int, y: Int), to: (x: Int, y: Int)) -> Double {
    return sqrt(pow(Double(from.x - to.x), 2) + pow(Double(from.y - to.y), 2))
}

// 양방향 전선 초기화.
var graph: [[(end: Int, distance: Double)]] = Array(repeating: ([]), count: n + 1)

for i in 1..<n {
    for j in i + 1...n {
        let distance: Double = distanceFrom(position[i], to: position[j])
        if distance <= m {
            graph[i].append((j, distance))
            graph[j].append((i, distance))
        }
    }
}

for _ in 1...w {
    let inputs: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    // 연결된 발전소간의 가중치는 0
    graph[inputs[0]].append((inputs[1], 0))
    graph[inputs[1]].append((inputs[0], 0))
}

var queue: [Int] = []
queue.append(1)
distances[1] = 0

var answer: Double = 0

while !queue.isEmpty {
    let first: Int = queue.removeFirst()
    let cost: Double = distances[first]
    
    for index in 0..<graph[first].count {
        if distances[graph[first][index].end] > cost + graph[first][index].distance {
            distances[graph[first][index].end] = cost + graph[first][index].distance
            queue.append(graph[first][index].end)
        }
    }
}

print(Int(distances[n] * 1000))
