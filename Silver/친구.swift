import Foundation

// 가장 유명한 사람을 구하는 방법은 각 사람의 2-친구 를 구하면 됨.
// 어떤 사람 a 가 b의 2-친구 가 되기 위해선 두 사람이 친구이거나 a와 친구이고, b와 친구인 c가 있어야 함.
// 2-친구 의 수가 가장 많은 사람이 유명한 사람이다.
// 이를 출력.

// A와 B가 친구면, B와 A도 친구이고, A와 A는 친구가 아니다.
// -> 양방향. 자신으로 오는 간선은 없음.

// 아이디어: 바로 이어지거나, 다른 하나의 노드를 거쳐서 이어지거나
// 즉, 해당 노드로 부터 거리가 2이하인 노드의 개수를 구한다.
// 모든 노드에서 모든 노드로의 최단 거리가 2이하인 경우만 구한다.
// 플로이드 워셜. 노드는 최대 50개.

let n: Int = Int(readLine()!) ?? -1
var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    let input: [String] = readLine()!.map { String($0) }
    
    for j in 0..<input.count {
        if input[j] == "Y" {
            graph[i][j] = true
        }
    }
}

var answer: Int = 0
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            if j == k { continue }
            
            if graph[j][k] {
                // 그냥 친구.
                visited[j][k] = true
            } else {
                if (graph[j][i] && graph[i][k]) {
                    // 한 노드를 통해 친구.
                    visited[j][k] = true
                }
            }
        }
    }
}

for visit in visited {
    answer = max(visit.filter { $0 == true }.count, answer)
}

print(answer)
