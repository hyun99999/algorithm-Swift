import Foundation

func solution(_ number:String, _ k:Int) -> String {
    // stack 을 사용하여 앞,뒤 숫자 비교.
    // 반복문으로 전체를 훑지 않아도 되기 때문에 시간 절약.
    var stack: [Character] = []
    let array: [String.Element] = number.map { $0 }
    // 동일.
    // let array: [Character] = number.map { $0 }
    // let array: [String.Element] = Array(number)
    
    // k 개의 숫자만큼 삭제.
    var delete: Int = 0
    var index: Int = 0
    
    // k개만큼 삭제하고, array 를 모두 탐색할 때까지 반복.
    while delete < k && index < array.count {
        var last: Character = " "
        
        if stack.isEmpty {
            stack.append(array[index])
            index += 1
            continue
        } else {
            last = stack.last!
            
            if last < array[index] {
                stack.removeLast()
                delete += 1
                continue
            }
            
            stack.append(array[index])
            index += 1
        }
    }
    
    if delete >= k {
        // k 개 만큼 삭제한 경우 나머지 숫자는 그냥 추가.
        stack.append(contentsOf: array[index...(array.endIndex - 1)])
    }
    
    if array.count >= index {
        // 끝까지 탐색했는데도 k 개 만큼 제거하지 못한 경우.(ex. 1111 에서 2개 삭제.)
        // 끝에서부터 삭제.
        return stack[0..<array.count - k].reduce("") { $0 + String($1) }
    }
    
    return stack.reduce("") { $0 + String($1) }
}

print(solution("1924", 2))
// "94"

print(solution("1231234", 3))
// "3234"

print(solution("4177252841", 4))
// "775841
