import Foundation

// 정확성 테스트 통과.
// 효율성 테스트 시간 초과.
/*
func solution(_ s:String) -> Int {
    // stack 활용
    var s: [String] = s.map { String($0) }
    var stack: [String] = []
    // 짝을 모두 제거할때까지 반복하므로 while.
    while !s.isEmpty {
        if stack.isEmpty {
            stack.append(s.removeFirst())
        } else {
            let first = s.removeFirst()
            let last = stack.removeLast()
            
            if first != last {
                stack.append(last)
                stack.append(first)
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}
 */

// s 를 자르거나 result 에 붙이는 작업을 줄임.
// 확연하게 정확성 테스트도 줄어들었다.
func solution(_ s:String) -> Int {
    var s = s.map { String($0) }
    var result: [String] = []
    
    for i in s.indices {
        if !result.isEmpty && result.last == s[i] {
            result.removeLast()
        } else {
            result.append(s[i])
        }
    }
    return result.isEmpty ? 1 : 0
}

print(solution("baabaa"))
// 1
