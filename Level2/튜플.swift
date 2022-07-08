import Foundation

func solution(_ s:String) -> [Int] {
    
    let startIndex = s.index(s.startIndex, offsetBy: 2)
    let endIndex = s.index(s.startIndex, offsetBy: s.count - 2)
    let newS = String(s[startIndex..<endIndex])
    var answer: [Int] = []
    
    newS.components(separatedBy: "},{")
        .map { $0.components(separatedBy: ",").map { Int($0)! } }
        .sorted { $0.count < $1.count}
        .forEach {
            $0.forEach {
                if !answer.contains($0) {
                    answer.append($0)
                }
            }
        }
    
    return answer
}

let result = solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
print(result)
