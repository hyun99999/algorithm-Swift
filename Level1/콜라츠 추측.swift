func solution(_ num:Int) -> Int {
    var count: Int = 0
    var num = num
   
    while !(count >= 500 || num == 1) {
        count += 1
        
        if num % 2 == 0 {
            // 짝수
            num /= 2
        } else {
            // 홀수
            num *= 3
            num += 1
        }
    }
    
    if count >= 500 {
        return -1
    } else {
        return count
    }
}

print(solution(16))
