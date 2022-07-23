func solution(_ n:Int64) -> [Int] {
    /*
    let elementsArray: [String.Element] = String(n).map { $0 }
    let stringArray: [String] = String(n).map { String($0) }
    let intArray: [Int] = String(n).map { Int(String($0))! }
    */
    return String(n).map{Int(String($0))!}.reversed()
}

print(solution(1234))
