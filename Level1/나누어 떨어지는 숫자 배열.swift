func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer: [Int] = []
    answer = arr.filter { $0 % divisor == 0}.sorted()
    if answer.isEmpty {
         return [-1]
    }
    return answer
}
