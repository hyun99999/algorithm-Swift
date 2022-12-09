/*
import Foundation

// 철수는 동생과 롤케이크를 공평하게 나누려한다.
// 조건 : 잘린 조각의 크기와 토핑개수에 상관없이 동일한 가짓수의 토핑이 올라가면 공평
// 공평하게 자르는 방법의 수를 반환.
func solution(_ topping:[Int]) -> Int {
    var answer: Int = 0
    
    // 아이디어 : 인덱스를 순회
    for index in 1..<topping.count {
        var leftDictionary: [Int : Int] = [:]
        var rightDictionary: [Int : Int] = [:]
        
        for leftIndex in 0..<index {
            leftDictionary[topping[leftIndex], default: 0] += 1
            
            for rightIndex in leftIndex + 1..<topping.count {
                rightDictionary[topping[rightIndex], default: 0] += 1
            }
        }
        
        if rightDictionary.count == leftDictionary.count {
            answer += 1
        }
    }
    
    return answer
}
*/
// 모든 테스트케이스에서 시간초과.
// -> topping 의 길이는 최대 1,000,000 이중 for문을 사용하는 것이 원인이라고 판단.

import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer: Int = 0
    var toppings: Set<Int> = []
    var left: [Int] = Array(repeating: 0, count: topping.count)
    var right: [Int] = Array(repeating: 0, count: topping.count)

    // ✅ 아이디어 : 왼/오른쪽부터 시작해서 롤케이크 토핑을 Set 에 저장. 누적합 사용.
    
    for index in 0..<topping.count {
        toppings.insert(topping[index])
        left[index] = toppings.count
    }
    
    toppings.removeAll()
    
    for index in stride(from: topping.count - 1, to: -1, by: -1) {
        toppings.insert(topping[index])
        right[index] = toppings.count
    }
    
    for index in 0..<topping.count - 1 {
        if left[index] == right[index + 1] {
            answer += 1
        }
    }
    
    return answer
}

print(solution([1, 2, 1, 3, 1, 4, 1, 2]))
// 2

print(solution([1, 2, 3, 1, 4]))
// 0
