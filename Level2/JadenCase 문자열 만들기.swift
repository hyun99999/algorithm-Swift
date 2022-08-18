import Foundation

// 실패
/*
func solution(_ s:String) -> String {
    // JadenCase : 모든 단어의 첫 문자가 대문자. 외는 소문자.
    // 단, 첫 문자가 알파벳이 아닐때는 이어지는 모든 알파벳 소문자.
    
    // 숫자는 단어의 첫 문자로만 등장.
    // 숫자로 이루어진 단어는 없다.
    // 공백문자는 연속 등장 없다. -> *근데 있는 듯...
    
    var s: [String] = s.components(separatedBy: " ")
    var answer: String = ""
    
    for i in 0..<s.count {
        let first = s[i].removeFirst()
        if first.isLetter {
            answer += first.uppercased()
        } else {
            answer += String(first)
        }
        answer += s[i].lowercased()
        answer += " "
    }
    
    answer.removeLast()
    
    return answer
}
*/

// 아이디어 :
// 마지막에 공백이 있다면 그대로 출력해야 했다.
// componenets 와 split 메소드를 사용하지 않기로 했다.

func solution(_ s:String) -> String {
    var answer: String = ""
    var isFirst: Bool = true
    
    for str in s {
        if str == " " {
            isFirst = true
            answer += String(str)
        } else if str.isNumber {
            isFirst = false
            answer += String(str)
        } else {
            // 문자
            if isFirst {
                answer += String(str.uppercased())
                isFirst = false
            } else {
                answer += String(str.lowercased())
            }
        }
    }
    
    return answer
}



print(solution("3people unFollowed me"))
// 3people Unfollowed Me

print(solution("for the last week"))
// For The Last Week
