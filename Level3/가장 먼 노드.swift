
import Foundation

// 각 노드가 가진 depth 를 배열로 반환.
func countDistance(_ graph: [Int: [Int]], n: Int) -> [Int] {
    var queue: [(Int, Int)] = [(1, 0)]
    var counts: [Int] = Array(repeating: -1, count: n + 1)
    counts[1] = 0
    
    while !queue.isEmpty {
        let (node, depth) = queue.removeFirst()
        
        for nextNode in graph[node]! {
            if counts[nextNode] > -1 {
                continue
            }
            
            counts[nextNode] = depth + 1
            queue.append((nextNode, depth + 1))
        }
    }
    
    return counts
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // n개의 노드
    // 1번 노드에서 가장 멀리 떨어진 노드의 갯수 반환.
    // 간선의 가중치가 동일. 노드로의 거리가 항상 최선이어야 함. -> BFS(너비 우선 탐색)
    // queue, while
    
    // 연결된 노드를 표시하는 dictionary.
    var graph: [Int: [Int]] = [:]
    
    for edge in edge {
        // 값이 없게 되면 default 로 전달된 값이 반환
        graph[edge[0], default: []].append(edge[1])
        graph[edge[1], default: []].append(edge[0])
    }
    
    let maxCount = countDistance(graph, n: n).max()!
    let answer = countDistance(graph, n: n).filter { $0 == maxCount }.count
    
    return answer
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
// 3
