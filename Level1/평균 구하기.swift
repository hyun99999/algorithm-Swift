func solution(_ arr:[Int]) -> Double {
    let sum: Int = arr.reduce(0, +)
    return Double(sum) / Double(arr.count)
}

print(solution([1,2,3,4]))
