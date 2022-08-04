import Foundation

/*
// 재귀
// 시간 초과로 인한 정확성 25.0/100.0
func solution(_ n:Int) -> Int {
    // 효진이는 한번에 1칸. 또는 2칸.
    // 멀리뛰기할 칸의 수에 대한 도달 방법이 몇가지인가?
    var answerArray: [[Int]] = []
    
    // 재귀로 도달할 때까지 다른 조합을 구성
    func combination(_ array: [Int]) {
        if array.reduce(0, { $0 + $1 }) == n {
            // 멀리뛰기 n만큼 도달.
            answerArray.append(array)
            return
        } else if array.reduce(0, { $0 + $1 }) > n {
            // 초과.
            return
        } else {
            for i in 1...2 {
                combination(array + [i])
            }
        }
    }
    
    combination([])
    
    return answerArray.count % 1234567
}
 */

// 재귀를 사용하기에는 숫자가 크다.
// 다이나믹 프로그래밍
func solution(_ n:Int) -> Int {
    // 1칸일 때는 1가지.
    // 2칸일 때는 2가지.
    // 3칸일 때는 1칸일 때 + 2칸일 때
    // 점화식 -> d(n) = d(n - 1) + d(n - 2)
    
//    var dp: [Int] = Array(repeating: 0, count: n + 1)
    var dp: [Int] = [0, 1, 2]
    
    if n < 3 {
        // n 은 1이상 조건 존재.
        return dp[n]
    }
    
    for i in 3...n {
        dp.append((dp[i - 1] + dp[i - 2]) % 1234567)
    }
    
    return dp[n]
}

print(solution(4))
// 5

print(solution(3))
// 3
