import Foundation

// DP
// DFS
func solution(_ N:Int, _ number:Int) -> Int {
    // 1 <= N <= 9
    // 사용횟수가 8보다 크면 -1 반환.
    if N == number {
        return 1
    }
    
    var answer: Int = -1
    
    func dfs(_ count: Int, _ now: Int) {
        // 재귀 종료 조건.
        if count > 8 {
            return
        }
        
        if now == number {
            // 기존의 answer 보다 count 가 최소인 경우 갱신.
            if count < answer || answer == -1 {
                answer = count
            }
            return
        }
        
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i {
                break
            }
                
            NN = NN * 10 + N
            // 사칙 연산에 대해서 모두 진행.
            print(count + 1+i, now + NN)
            dfs(count + 1 + i, now + NN)
            dfs(count + 1 + i, now - NN)
            dfs(count + 1 + i, now * NN)
            dfs(count + 1 + i, now / NN)
        }
    }
    
    dfs(0, 0)
    
    return answer
}

print(solution(5, 12))
// 4

print(solution(2, 11))
// 3
