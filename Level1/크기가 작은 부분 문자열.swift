import Foundation

// p 의 길이만큼의 부분문자열 중 p 이하인 횟수 반환.

func solution(_ t:String, _ p:String) -> Int {
    let number: Int = p.count
    let p: Int = Int(p) ?? 0
    let t: [String] = t.map { String($0) }
    
    var answer: Int = 0
    
    for i in 0...t.count - number {
        let slicedT: Int = Int(t[i..<(i + number)].reduce("", +)) ?? 0
        
        if p >= slicedT {
            answer += 1
        }
    }
    
    return answer
}

print(solution("3141592", "271"))
// 2
print(solution("10203", "15"))
// 3


