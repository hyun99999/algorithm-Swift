import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    // 정확하게 순위를 매길 수 있는 선수의 수를 반환

    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var winLoseInfo: [(win: Int, lose: Int)] = Array(repeating: (0, 0), count: n + 1)
    
    // 이긴 노드에 진 노드를 연결.
    for result in results {
        graph[result[0]].append(result[1])
    }
    
    // ✅ 아이디어 : 모든 노드를 탐색해야하기 때문에 dfs.
    func dfs(_ number: Int) {
        var queue: [Int] = []
        var visited: [Bool] = Array(repeating: false, count: n + 1)
        
        queue.append(number)
        
        while !queue.isEmpty {
            let first: Int = queue.removeFirst()
            visited[first] = true
            
            for node in graph[first] {
                if !visited[node] {
                    visited[node] = true
                    
                    winLoseInfo[node].lose += 1
                    winLoseInfo[number].win += 1
                    
                    queue.append(node)
                }
            }
        }
    }
    
    // 이렇게 모든 노드를 탐색할 수 있음.
    for n in 1...n {
        dfs(n)
    }
    
    // 승패 합산이 n - 1인 노드만 선택.
    return winLoseInfo.filter { $0 + $1 == n - 1 }.count
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
// 2
