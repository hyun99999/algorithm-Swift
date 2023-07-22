// 계단 오르기 게임은 시작부터 꼭대기까지 가는 게임이다.
// 계단을 밟으면 점수를 얻는다.
// 계단 오르는 규칙이 있다.

// 계단은 한 번에 한 계단 혹은 두 계단. 즉, 일단 밟고 다음 혹은 다다음으로 이동 가능.
// 시작점은 계단이 아님. 마지막 계단은 꼭 밟아야 함.
// 최댓값을 구하시오.

// 단계별로 최댓값을 저장하면 되니깐, 계단의 갯수도 300이하.
// dp
let n: Int = Int(readLine()!) ?? 0

var score: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
    let input: Int = Int(readLine()!) ?? 0
    
    score[i] = input
}

// MARK: - 입력 끝

var dp: [Int] = Array(repeating: 0, count: n)

// 세 번째 계단까지는 연속으로 올라올 수 없기 때문에 설정해야 함.
dp[0] = score[0]

// 🚨 계단 갯수 n은 100이하의 자연수.
if n >= 2 {
    dp[1] = max(score[0] + score[1], score[1])
}

if n >= 3 {
    dp[2] = max(score[0] + score[2], score[1] + score[2])
}

if n >= 4 {
    for i in 3..<n {
        // 두 칸을 바로 올라오기 vs 한 칸을 바로 올라오기
        dp[i] = max(dp[i - 2] + score[i], dp[i - 3] + score[i - 1] + score[i])
    }
}

print(dp[n - 1])

/*
6
10
20
15
25
10
20
*/

// 75
