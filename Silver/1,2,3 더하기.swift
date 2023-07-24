// n 이 주어질 때 1,2,3 으로 나타내는 방법의 수를 구하시오.

let t: Int = Int(readLine()!) ?? 0

var answer: [Int] = []

// dp
// 점화식 찾기
var dp: [Int] = Array(repeating: 0, count: 11)

// 1 = 1
// 2 = 1(1+1) 1(2)
// 3 = 1(1+1+1) 2(2+1) 1(3)
// 4 = 1(1+1+1+1) 3(2+1+1) 2(3+1) 1(2+2)
// 5 = 1(1+1+1+1+1) 4(2+1+1) 3(3+1+1) 3(2+2+1) 2(2+3)

// 이전 조합에서 1만 더해주면 만들 수 있개 때문에 dp[i - 1]
dp[1] = 1
dp[2] = 2
dp[3] = 4

for _ in 0..<t {
    // 11미만
    let n: Int = Int(readLine()!) ?? 0
    
    if 4 <= n {
        for i in 4...n {
            dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]
        }
    }

    answer.append(dp[n])
}

answer.forEach { print($0) }

/*
 3
 4
 7
 10
 */

/*
 7
 44
 274
 */
