import Foundation

// 아이디어 : stack 을 사용하여 ( 는 삽입하고, ) 은 삭제하여 stack 이 최종적으로 비워져있는 경우 true 반환.
/*
// 효율성 테스트에서 시간 초과.
func solution(_ s:String) -> Bool {
// 괄호가 바르다 -> ( 문자로 열렸으면 반드시 짝지어서 ) 로 닫혀야 한다.
    var stack: [Character] = []
    let s: [String.Element] = s.map { $0 }
    
    for string in s {
        if string == "(" {
            stack.append(string)
        } else {
            // ")"
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty ? true : false
}
 */

// 시간 초과 해결방법 : ( 와 ) 의 갯수가 같다면 올바른 괄호다.(스택 사용하지 않음.)
// 단, ( 보다 ) 가 먼저 오게되는 경우는 올바른 괄호가 아니다.
func solution(_ s:String) -> Bool {
// 괄호가 바르다 -> ( 문자로 열렸으면 반드시 짝지어서 ) 로 닫혀야 한다.
    // map 을 사용하지 않아도 String 은 for 문에서 사용 가능.
//    let s: [String.Element] = s.map { $0 }
    
    var count = 0
    
    for element in s {
        if element == "(" {
            count += 1
        } else if count == 0 && element == ")" {
            return false
        } else {
            count -= 1
        }
    }
    
    return count == 0 ? true : false
}

print(solution(")()("))
// false

print(solution("(())()"))
// true

