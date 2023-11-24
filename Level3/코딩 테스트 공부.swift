import Foundation

// 2차원 dp

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    // 도달해야하는 최대 알고력
    // 도달해야하는 최대 코딩력 구하기
    var maxAlp: Int = 0
    var maxCop: Int = 0
    
    for i in 0..<problems.count {
        maxAlp = max(maxAlp, problems[i][0])
        maxCop = max(maxCop, problems[i][1])
    }
    
    let alp: Int = min(alp, maxAlp)
    let cop: Int = min(cop, maxCop)
    
    /// 알고력, 코딩력 상태에 도달하는데 필요한 최단 시간
    var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: maxCop + 1), count: maxAlp + 1)
    // 초기 알고력, 코딩력
    dp[alp][cop] = 0
    
    // *다음 세 가지 경우를 고려해서 해당 알고력, 코딩력에 필요한 최단 시간 구하기
    
    for i in alp...maxAlp {
        for j in cop...maxCop {
            if i + 1 <= maxAlp {
                // 알고리즘 공부해서 알고력 1 올리기
                dp[i + 1][j] = min(dp[i + 1][j], dp[i][j] + 1)
            }

            if j + 1 <= maxCop {
                // 코딩을 공부해서 코딩력 1 올리기
                dp[i][j + 1] = min(dp[i][j + 1], dp[i][j] + 1)
            }
            
            // 문제를 골라서 알고력과 코딩력 올리기
            for p in 0..<problems.count {
                if problems[p][0] <= i && problems[p][1] <= j {
                    let nextAlp: Int = min(maxAlp, i + problems[p][2])
                    let nextCop: Int = min(maxCop, j + problems[p][3])
                    dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop], dp[i][j] + problems[p][4])
                }
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}

print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
// 15
