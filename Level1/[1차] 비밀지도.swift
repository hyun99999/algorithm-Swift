func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    // 체크
    var answer: [String] = []

    for i in 0..<n {
        // 1 + 1 = 1, 0 + 0 = 0, 1 + 0 = 1.
        // or 연산.
        let binary: String = String(arr1[i] | arr2[i], radix: 2)
        let array = String(repeating: "0", count: n - binary.count) + binary
        answer += [array.reduce("", { $0 + ($1 == "1" ? "#" : " ") })]
    }
    
    
    return answer
}


let result = solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
// ["#####","# # #", "### #", "# ##", "#####"]
print(result)
