func solution(_ n:Int) -> Int {
    var count = 0
    
    // n = 0 인 경우. 16번 테스트 케이스.
    if n == 0 { return 0 }
    
    for i in 1...n {
        if n % i == 0 {
            count += i
        }
    }
    
    return count
}

print(solution(12))
// 28
