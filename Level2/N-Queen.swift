import Foundation

// 백트래킹 문제(dfs)
func solution(_ n:Int) -> Int {
    // 행과 같은 배열의 인덱스에 퀸이 위치하는 열을 값으로 가짐.
    // 결과적으로 모든 인덱스에 다른 열의 값을 가지는 조합을 찾기.
    var chess: [Int] = Array(repeating: -1, count: n)
    var answer = 0
    
    func check(x: Int, y: Int) -> Bool{
        for i in 0..<x {
            // 같은 열에 퀸이 있음.
            if chess[i] == y {
                return false
            }
            
            // 대각선 확인.
            if abs(x - i) - abs(y - chess[i]) == 0 {
                return false
            }
        }
        return true
    }
    
    func dfs(_ depth: Int) {
        if depth == n {
            answer += 1
            return
        }
        
        for i in 0..<n {
            // 열 검사, 대각선 검사
            if check(x: depth, y: i) {
                // depth 행 i 열에 퀸 배치.(이때 같은 행에 퀸이 들어올 수 없음.)
                chess[depth] = i
                // depth 행 i 열에 퀸을 배치하면서 끝까지 감. 깊이 탐색 후, 돌아오면 chess[depth] = -1 초기화하여 다른 조합을 찾게 됨.
                dfs(depth + 1)
                chess[depth] = -1
            }
        }
    }
    
    dfs(0)
    
    return answer
}

print(solution(4))
// 2
