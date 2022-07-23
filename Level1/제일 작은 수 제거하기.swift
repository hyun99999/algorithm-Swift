func solution(_ arr:[Int]) -> [Int] {
    var answer: [Int] = arr
    // 작은 수의 배열을 제거한 후 빈 배열이라면 -1 반환.
    let min: Int = answer.min()!
    let index: Array<Int>.Index = answer.firstIndex(of:min)!
    answer.remove(at: index)
    return answer.count == 1 ? [-1] : answer
}

print(solution([4,3,2,1]))
//
