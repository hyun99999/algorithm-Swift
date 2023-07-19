// 문방구에서 2n개의 스티커 구매.(2행 n열)
// 스티커 한장을 떼면, 변을 공유하는 상하좌우의 스티커를 사용할 수 없다.
// 스티커에는 점수가 있는데 점수의 합이 최대가 되게 스티커를 떼려고 한다.

let t: Int = Int(readLine()!) ?? 0

var answer: [Int] = []

for _ in 0..<t {
    // n <= 100,000
    let n: Int = Int(readLine()!) ?? 0
    
    var score: [[Int]] = []
    
    for _ in 0..<2 {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        
        score.append(input)
    }
    
    // MARK: - 입력 끝
    
    // ✅ 완전탐색으로 조합을 구하기 힘듦.
    // 최대 스티커는 5개.(그 이하도 조합으론 가능.) 100,000C5 도 많음.
    // -> 다음단계에 무엇을 기억해야함.
    // DP
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: 2)
    
    if n == 1 {
        answer.append(max(score[0][0], score[1][0]))
    } else if n == 2 {
        answer.append(max(score[0][1] + score[1][0], score[0][0] + score[1][1]))
    } else {
        dp[0][0] = score[0][0]
        dp[1][0] = score[1][0]
        
        // 점화식
        if n > 1 {
            dp[0][1] = score[1][0] + score[0][1]
            dp[1][1] = score[0][0] + score[1][1]
            
            for i in 2..<n {
                dp[0][i] = max(dp[1][i-1] + score[0][i], dp[1][i-2] + score[0][i])
                dp[1][i] = max(dp[0][i-1] + score[1][i], dp[0][i-2] + score[1][i])
            }
        }
        answer.append(max(dp[0][n - 1], dp[1][n - 1]))
    }
}

answer.forEach { print($0) }
