func solution(_ a:Int, _ b:Int) -> Int64 {
    var answer: Int = 0
    if a <= b {
        for n in a...b {
            answer += n
        }
    } else {
        for n in b...a {
            answer += n
        }
    }

    return Int64(answer)
}

print(solution(3, 5))
print(solution(3, 3))
print(solution(5, 3))
