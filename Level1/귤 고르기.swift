import Foundation

// 아이디어 : 무게별로 dictionary 생성 후, key 값을 total 에 더함.
func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var answer: Int = 0
    var tangerineDictionary: [Int: Int] = [:]
    var newTangerines: [Int] = []
    var total: Int = 0
    
    // 이 과정을 아래와 같이 변경 가능.
    /*
    for index in 0..<tangerine.count {
        if tangerineDictionary[tangerine[index]] != nil {
            tangerineDictionary[tangerine[index]]! += 1
        } else {
            tangerineDictionary[tangerine[index]] = 1
        }
    }
    */
    
    tangerine.forEach { tangerineDictionary[$0, default: 0] += 1}
    
    // value 를 기준으로 key 를 정렬.
    newTangerines = Array(tangerineDictionary.keys).sorted { tangerineDictionary[$0]! > tangerineDictionary[$1]! }
    
    for index in 0..<newTangerines.count {
        if total < k {
            answer += 1
            if let numbers = tangerineDictionary[newTangerines[index]] {
                total += numbers
            }
        } else {
            break
        }
    }
    
    return answer
}

print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
// 3
