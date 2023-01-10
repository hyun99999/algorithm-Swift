import Foundation

// p 의 길이만큼의 부분문자열 중 p 이하인 횟수 반환.
func solution(_ t:String, _ p:String) -> Int {
    let number: Int = p.count
    let p: Int = Int(p) ?? 0
    let t: [Int] = t.map { Int(String($0)) ?? 0 }
    
    var answer: Int = 0
    
    for i in 0...t.count - number {
        let slicedT: [Int] = Array(t[i..<(i + number)])
        var joinedT: String = ""
        slicedT.forEach { number in
            joinedT.append(String(number))
        }
        
        if p >= Int(joinedT) ?? 0 {
            answer += 1
        }
    }
    
    return answer
}


print(solution("3141592", "271"))
// 2
print(solution("10203", "15"))
// 3
