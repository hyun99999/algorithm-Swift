func solution(_ n:Int64) -> Int64 {
    let stringArray: [String.Element] = String(n).sorted(by: >)
    return Int64(String(stringArray))!
}

print(solution(118372))
