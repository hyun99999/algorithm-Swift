import Foundation

// s 가 주어졌을 때, s의 각 위치마다 자신보다 앞, 가장 가까운 곳에 있는 같은 글자의 위치를 알고 싶다.
// 자신보다 앞에 글자가 없으면 -1
// 두 칸 앞에 같은 글자가 있으면 2
func solution(_ s:String) -> [Int] {
    var dictionary: [String : Int] = [:]
    var answer: [Int] = []
    let s: [String] = s.map { String($0) }
    
    for index in 0..<s.count {
        if dictionary[s[index]] == nil {
            answer.append(-1)
            dictionary[s[index]] = index
        } else {
            answer.append(index - dictionary[s[index], default: 0])
            dictionary[s[index]] = index
        }
    }
    
    return answer
}

print(solution("banana"))
// [-1, -1, -1, 2, 2, 2]
