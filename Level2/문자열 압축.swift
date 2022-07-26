import Foundation

// s 가 1,000 이하이므로 문자를 자르는 단위를 모두 고려해도 가능.
func solution(_ s:String) -> Int {
    var answer: String = s
    let s: [String.Element] = s.map { $0 }
    var prefixWords: String = ""
    
    for n in 1...s.count {

        // n = 문자열 자르는 단위
        
        var str: String = ""
        var index: Int = 0
        var count: Int = 1
        
        for i in 1...s.count / n {
            let words: String = String(s[index..<index + n])
            
            if prefixWords == words {
                // 압축 가능.
                count += 1
            } else {
                // 압축 불가능. 새로운 문자 등장.
                if i == 1 {
                    prefixWords = words
                } else {
                    str += count == 1 ? "\(prefixWords)" : "\(count)\(prefixWords)"
                    count = 1
                    prefixWords = words
                }
            }
            
            if i == s.count / n {
                // 끝
                str += count == 1 ? "\(words)" : "\(count)\(words)"
            }
            
            index = n * i
        }
        
        // 단위로 나누어 떨어지지 않는 문자들은 그냥 추가.
        if s.count % n != 0 {
            let words: String = String(s[index..<s.endIndex])
            str += words
        }

        answer = answer.count > str.count ? str : answer
    }
    return answer.count
}

print(solution("aabbaccc"))
// 7
