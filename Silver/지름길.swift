import Foundation

// 세준이는 학교에 가기 위해 d킬로미터 길이의 고속도로를 지난다.
// 고속도로의 지름길을 알게됨. 모든 지름길은 일방통행. 고속도로를 역주행할 수 없음.
// 세준이가 운전해야하는 거리의 최솟값은?

let nd: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 지름길의 개수. 12 이하.
let n: Int = nd[0]
/// 고속도로의 길이. 10,000 이하.
let d: Int = nd[1]

// 최단 거리. 0부터 d까지의 최단거리 구하기.
// 다익스트라. 한 노드에서 모든 노드 구하기.

var distance: [Int] = Array(repeating: Int.max, count: 10001)
var roads: [[(end: Int, cost: Int)]] = Array(repeating: [], count: 10001)

// 지름길 간선 추가.
for _ in 0..<n {
    let inputs: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    
    if inputs[2] > d {
        continue
    }
    roads[inputs[0]].append((inputs[1], inputs[2]))
}

// 다음 도로로의 간선 추가.
for index in 0..<roads.count - 1 {
    roads[index].append((index + 1, 1))
}

// 다익스트라.

var queue: [(end: Int, cost: Int)] = []

queue.append((0,0))
distance[0] = 0

while !queue.isEmpty {
    let first: (end: Int, cost: Int) = queue.removeFirst()

    if first.end > d {
        continue
    }

    for index in 0..<roads[first.end].count {
        if distance[roads[first.end][index].end] > first.cost + roads[first.end][index].cost {
            distance[roads[first.end][index].end] = first.cost + roads[first.end][index].cost
            queue.append((roads[first.end][index].end, first.cost + roads[first.end][index].cost))
        }
    }
}

print(distance[d])
