// 현서는 찬홍이에게 가기까지 만나는 모든 소들에게 여무을 줘야 합니다.
// 이때 최소한의 소들을 만나면서 가고싶습니다.
// n개의 헛간이 있고, 이를 소들의 길이 잇고 있습니다. 양방향.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

typealias Destination = (end: Int, value: Int)
var board: [[Destination]] = Array(repeating: [], count: nm[0] + 1)

// 가중치가 다름. 최단 경로.
// 다익스트라.

var distance: [Int] = Array(repeating: Int.max, count: nm[0] + 1)
var queue: [Int] = []

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    board[input[0]].append((input[1], input[2]))
    board[input[1]].append((input[0], input[2]))
}

// 두 개의 헛간은 하나 이상의 길로 연결되어 있을 수 있다고 함.
for i in 0..<nm[0] {
    board[i].sort { $0.value < $1.value }
}

// MARK: - dijkstra

func dijkstra(_ start: Int) {
    queue.append(start)
    distance[start] = 0
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        for next in board[first] {
            if distance[next.end] > distance[first] + next.value {
                queue.append(next.end)
                distance[next.end] = distance[first] + next.value
            }
        }
    }
}

dijkstra(1)

print(distance[nm[0]])

/*
 6 8
 4 5 3
 2 4 0
 4 1 4
 2 1 1
 5 6 1
 3 6 2
 3 2 6
 3 4 4
 */

// 5
