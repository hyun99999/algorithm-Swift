import Foundation

// 아이디어:
// 7 9 1 1 4 + 7 9 1 1 4
// 위와 같이 연결시켜서 생각.
/*
func solution(_ elements:[Int]) -> Int {
    let newElements: [Int] = elements + elements
    var sums: Set<Int> = []
    
    for i in 0..<elements.count {
        for j in 1...elements.count {
            let sum: Int = Array(newElements[i..<(i + j)]).reduce(0, +)
            // 합하는 과정에서 시간 초과가 나온다고 판단.
            
            sums.insert(sum)
        }
    }
    
    return sums.count
}
*/
// 테스트 6-20 시간초과

func solution(_ elements:[Int]) -> Int {
    let newElements: [Int] = elements + elements
    var sums: Set<Int> = []
    
    for i in 0..<elements.count {
        for j in 1...elements.count {
            let array: [Int] = Array(newElements[i..<(i + j)])
            var sum: Int = 0
            // 합하는 과정에서 시간 초과가 나온다고 판단.
            // for 문을 통해서 합을 계산하였다.
            for index in 0..<array.count {
                sum += array[index]
            }
            // -> 통과.

            sums.insert(sum)
        }
    }
    
    return sums.count
}

print(solution([7,9,1,1,4]))
// 18
