import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var combinationArray: [[Int]] = []
    var result: Int = 0
    
    /// index 로 조합 생성
    func combination(_ array: [Int]) {
        if array.count == dungeons.count {
            combinationArray.append(array)
            return
        } else {
            for i in 0..<dungeons.count {
                if !array.contains(i) {
                    combination(array + [i])
                }
            }
        }
    }
    
    combination([])
    
    combinationArray.forEach {
        var count = 0
        var k = k
        for index in $0 {
            if k >= dungeons[index][0] {
                k -= dungeons[index][1]
                count += 1
            }
        }
        result = max(count, result)
    }
    
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]]))
