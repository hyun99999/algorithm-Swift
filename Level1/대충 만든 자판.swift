import Foundation

// 동일한 키에 여러 개의 문자가 순서대로 할당된다.
// 이 휴대폰 자판을 이용해 특정 문자열을 작성할 때 키를 최소로 누르고 싶다.
// targets 를 작성하위해 몇 번씩 눌러야하는지 순서대로 배열에 담아 반환.
// 작성할 수 없을 때 -1 저장
func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    let keymaps: [[String]] = keymap.map { $0.map { String($0) } }
    
    var answer: [Int] = Array(repeating: 0, count: targets.count)
    
    for i in 0..<targets.count {
        // keymap 원소의 길이는 100이하이기 때문에 완전 탐색으로 최소 버튼 수를 더함
        let target: [String] = targets[i].map { String($0) }
        
        for j in 0..<target.count {
            var isAvailable: Bool = false
            var minCount: Int = Int.max
            
            for k in 0..<keymaps.count {
                for q in 0..<keymaps[k].count {
                    if keymaps[k][q] == target[j] {
                        minCount = min(minCount, q + 1)
                        isAvailable = true
                        break
                    }
                }
            }
                
            if isAvailable {
                if answer[i] == -1 {
                    break
                } else {
                    answer[i] += minCount
                }
            } else {
                answer[i] = -1
            }
        }
    }
    
    return answer
}

print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))
// [9,4]
