import Foundation

// 빵(1) - 야채(2) - 고기(3) - 빵
// 순서로 햄버거를 포장.
// stack 구조.
func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var answer: Int = 0
    
    // 아이디어 : stack 인덱스의 ingredient.count-4...<ingredient.count 까지(즉, 뒤에서부터 4개)를 검사하여 햄버거가 포장되면 포장.
    // 다시말해 마지막 요소를 추가했을 때 끝에서 4개가 햄버거가 될 수 있냐를 묻는 문제.
    // ingredient 를 모두 순회했다면 끝.
    for (_, value) in ingredient.enumerated() {
        stack.append(value)
        
        if stack.count < 4 { continue }
        
        if stack[(stack.count - 4)..<stack.count] == [1, 2, 3, 1] {
            answer += 1
            stack = Array(stack[0..<(stack.count - 4)])
        }
    }
    
    // 포장할 수 있는 햄버거의 개수.
    return answer
}

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
// 2

print(solution([1,2,3,1]))
// 1
