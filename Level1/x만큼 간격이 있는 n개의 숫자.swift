func solution(_ x:Int, _ n:Int) -> [Int64] {
    var answer: [Int64] = []
    
    for n in 1...n {
        answer += [Int64(x * n)]
    }
    return answer
}

print(solution(2, 5))
