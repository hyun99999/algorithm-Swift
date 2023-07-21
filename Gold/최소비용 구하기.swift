// 한 도시에서 다른 도시에 도착하는 m개
// a 번째 도시에서 b번째 도시까지 드는 비용을 최소화.
//

let n: Int = Int(readLine()!) ?? 0
let m: Int = Int(readLine()!) ?? 0

typealias Destination = (end: Int, value: Int)
var graph: [[Destination]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    graph[input[0]].append((input[1], input[2]))
}

// 🚨 시간초과.
// 🚨 중복된 곳으로 가는 버스가 있을 수 있다. 최솟값부터 계산.
for i in 0..<n {
    graph[i].sort { $0.value < $1.value }
}

// 가중치가 다름.
// 다익스트라
// 방문하지 않는 곳 중 최단거리 선택.

var queue: [Int] = []
var distance: [Int] = Array(repeating: Int.max, count: n + 1)

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (start, end) = (input[0], input[1])

distance[start] = 0

func dijkstra(_ start: Int) {
    queue.append(start)
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        for next in graph[first] {
            if distance[next.end] > next.value + distance[first] {
                distance[next.end] = next.value + distance[first]
                queue.append(next.end)
            }
        }
    }
}
                
dijkstra(start)

print(distance[end])
