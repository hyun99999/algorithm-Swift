import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    // n : 컴퓨터의 개수
    // computers : 연결 정보.
    
    var visited: [Bool] = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(_ vertax: Int) {
        visited[vertax] = true
        for col in 0..<computers[0].count {
            if computers[vertax][col] == 1 && !visited[col] {
                dfs(col)
            }
        }
    }

    // DFS(깊이 탐색)
    // 재귀
    // 아이디어 : 끝까지 탐색하여 하나의 네트워크를 구축하고 다음 연결되지 않은 vertax 를 구해야하기 때문에 한번에 깊게 들어가는 dfs 로 해결
    for row in 0..<n {
        if !visited[row] {
            count += 1
            dfs(row)
        }
    }
    
    // 네트워크 개수 반환.
    return count
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
// 2
