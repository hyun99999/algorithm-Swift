import Foundation

// 두 지역 간의 길을 통과하는데 걸리는 시간은 모두 1
// 최단시간으로 복귀하고자 한다. 복귀하지 못하는 부대원도 있을 수 있다. 이때 -1
// 양방향
// source 순서대로 복귀할 수 있는 최단시간을 담아서 반환.
// 강철부대로 복귀할수 있는 최단시간을 담아서 반환
func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    
    for road in roads {
        graph[road[0]].append(road[1])
        graph[road[1]].append(road[0])
    }
    
    var answer: [Int] = []
    
    // 도착지가 같으므로 도착에서 출발하는 것
    
    // bfs
    var queue: [Int] = []
    var distance: [Int] = Array(repeating: -1, count: n + 1)
    
    queue.append(destination)
    distance[destination] = 0
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        for next in graph[first] {
            if distance[next] == -1 {
                distance[next] = distance[first] + 1
                queue.append(next)
            }
        }
    }
    
    for source in sources {
        answer.append(distance[source])
    }
    
    return answer
}

print(solution(3, [[1, 2], [2, 3]], [2, 3], 1))
// [1, 2]

print(solution(5, [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]], [1, 3, 5], 5))
// [2, -1, 0]
