import Foundation

// 전선을 끊어 최대한 비슷한 개수의 송전탑을 갖는 두 전력망 만들기
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // n: 송전탑의 개수
    // wires: 전선 정보. [v1, v2] 1 <= v1 < v2 <= n
    var answer: Int = 0
    /// 송전탑 정보.
    var tree: [Int: [Int]] = [:]
    
    for i in 1...n {
        tree.updateValue([], forKey: i)
    }
    for wire in wires {
        // 서로 연결된 전선.
        tree[wire[0]]!.append(wire[1])
        tree[wire[1]]!.append(wire[0])
    }
    
    // 아이디어 : 트리에서 이미 방문했다고 가정하면 그래프에서 엣지를 끊은 것과 동일 효과.
    // bfs
    
    func bfs(_ start: Int) -> Int {
        var stack: [Int] = [start]
        var count = 0
        
        while count < stack.count {
            let last = stack[count]
            count += 1
            visited[last] = true
            
            for node in tree[last]! {
                if !visited[node] {
                    stack.append(node)
                }
            }
        }
        
        return count
    }
    
    // 1과 분리된 전력망의 송전탑 차이 구하기.
    var visited = Array(repeating: false, count: n + 1)
    visited[1] = true
    let count: Int = bfs(2)
    answer = abs(count - (n - count))
    
    for i in 1...n {
        visited = Array(repeating: false, count: n + 1)
        // 각 노드에서 방문기록을 true 로 변경하면서 끊어지도록 하고, 전선 수 비교.
        visited[i] = true
        let count = bfs(1)
        answer = min(answer, abs(count - (n - count)))
    }
    
    // 두 전력망이 가진 송전탑의 개수의 차이(절대값)리턴.
    return answer
}
