// 두 집 사이에는 경로가 항상 존재하고 이때 경로의 합을 최소로 하고 싶다.
// 한 마을을 두 개의 마을로 나누고 싶다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var edges: [(start: Int, end: Int, cost: Int)] = []

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    edges.append((input[0], input[1], input[2]))
}

// 최소 신장 트리
// union-find.
// parentArray

edges.sort { $0.cost < $1.cost }

var parentArray: [Int] = Array(repeating: 0, count: nm[0] + 1)

for i in 0...nm[0] {
    parentArray[i] = i
}

func find(_ child: Int) -> Int {
    return parentArray[child] == child ? child : find(parentArray[child])
}

func union(start: Int, end: Int) {
    let startParent: Int = find(start)
    let endParent: Int = find(end)
    
    if startParent > endParent {
        parentArray[startParent] = endParent
    } else {
        parentArray[endParent] = startParent
    }
}

var cost: Int = 0
/// 마지막으로 연결된 간선. 즉, 가중치가 가장 큰 간선.
var last: Int = 0

for edge in edges {
    if find(edge.start) != find(edge.end) {
        union(start: edge.start, end: edge.end)
        cost += edge.cost
        last = edge.cost
    }
}

print(cost - last)

/*
7 12
1 2 3
1 3 2
3 2 1
2 5 2
3 4 4
7 3 6
5 1 5
1 6 2
6 4 1
6 5 3
4 5 3
6 7 4
*/

// 8
