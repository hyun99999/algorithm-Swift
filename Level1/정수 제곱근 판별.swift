import Foundation

func solution(_ n:Int64) -> Int64 {
    var x: Int = 0
    
    while x * x <= n {
        if x * x == n {
            return Int64((x + 1) * (x + 1))
        }
        x += 1
    }
    return -1
}

print(solution(121))
// 144
