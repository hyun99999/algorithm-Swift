import Foundation

// k 칸을 앞으로 점프
// k 만큼 건전지 사용량 줄어듬

// 현재까지 온 거리  * 2 위치로 순간이동
// 건전지 사용량 줄지 않음

// n 만큼 떨어진 거리를 가려고 한다.
// 건전지 사용량 최소
func solution(_ n:Int) -> Int {
    var n = n
    var ans:Int = 0
    while n != 1 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            ans += 1
        }
    }
    // n 이 1 되기 때문에 1만큼 건전지 사용
    ans += 1
    
    return ans
}
