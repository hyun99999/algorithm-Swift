import Foundation

func solution(_ s:String) -> [Int] {
    var s: String = s
    var binaryCount: Int = 0
    var removeZeroCount: Int = 0
    
    while s != "1" {
        let onlyOne: String = s.filter { $0 == "1" }
        removeZeroCount += s.count - onlyOne.count
        s = String(onlyOne.count, radix: 2)
        binaryCount += 1
    }
    
    return [binaryCount, removeZeroCount]
}

let result = solution("110010101001")
// [3,8]
print(result)
