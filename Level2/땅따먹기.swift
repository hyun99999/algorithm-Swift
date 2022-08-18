import Foundation

// 정확성 통과 O. 효율성 통과 X.
/*
func solution(_ land:[[Int]]) -> Int{
    // 같은 열을 연속해서 밟을 수 없는 규칙.
    // 이전 열을 기억한 뒤 land를 순회하려고 했는데,
    // 1111
    // 2223
    // 3334
    // 인 경우에 134 를 고르는 방법이 정답인데 순회를 통해서는 알 수 없겠다고 판단했다.
    
    // 아이디어 : 다이나믹 프로그래밍
    // 4 열에 대해 시작했을 때 얻을 수 있는 합을 저장.
    var dp: [[Int]] = land
    
    for i in 1..<land.count {
         for j in 0..<land[0].count {
             for k in 0..<land[0].count {
                 if j == k { continue }
                 // dp[i - 1][k] 는 이전 줄 순회.
                 dp[i][j] = max(dp[i][j], dp[i - 1][k] + land[i][j])
             }
         }
     }
     
     return dp.last!.max()!
 }
 */

// 효율성 테스트 통과하기 위해서

func solution(_ land:[[Int]]) -> Int{
    var land = land
    for i in 0..<(land.count-1) {
        // 4열 하드코딩.
        land[i+1][0] += max(land[i][1], land[i][2], land[i][3])
        land[i+1][1] += max(land[i][0], land[i][2], land[i][3])
        land[i+1][2] += max(land[i][0], land[i][1], land[i][3])
        land[i+1][3] += max(land[i][0], land[i][1], land[i][2])
    }

    return max(land.last![0],land.last![1], land.last![2], land.last![3])
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
// 16
