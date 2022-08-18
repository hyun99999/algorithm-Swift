import Foundation

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

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
// 16
