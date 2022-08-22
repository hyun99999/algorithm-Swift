import Foundation

// 아이디어: 투포인터
func solution(_ gems:[String]) -> [Int] {
    // 진열대를 가리키는 두 개의 포인터
    var left: Int = 0
    var right: Int = -1
    // 모든 보석을 가리키는 최소 진열대를 가리키는 시작점과 끝점.
    var start: Int = 0
    var end: Int = gems.count
    // gems 에서 가짓수를 알아내기 위해 Set 사용.
    let gemsSetCount: Int = Set(gems).count
    // 가리키는 진열대의 보석의 갯수를 저장.
    var gemsDictionary: [String : Int] = [:]
    
    // 탈출 조건 : 진열대를 가리키지 않는다면 탐색 끝.
    while left < gems.count && right < gems.count {
        // 보석이 많다면 left 늘리고.
        // 보석이 적다면 right 늘리고.
        if gemsSetCount == gemsDictionary.count {
            // 조건 : 모든 종류의 보석을 담을 수 있음.
            // 모든 더 보석을 짧은 진열대에서 담을 수 있음.
            if end - start > right - left {
                start = left
                end = right
            }
            
            // 보석의 종류가 한 가지뿐.
            if left == right {
                return [1, 1]
            }
            
            if gemsDictionary[gems[left]] != nil {
                if gemsDictionary[gems[left]]! - 1 == 0 {
                    gemsDictionary.removeValue(forKey: gems[left])
                } else {
                    gemsDictionary[gems[left]]! -= 1
                }
            }
            
            left += 1
        } else {
            // 조건 : 보석을 다 담을 수 없음.
            right += 1
            
            if right < gems.count {
                if gemsDictionary[gems[right]] != nil {
                    gemsDictionary[gems[right]]! += 1
                } else {
                    gemsDictionary[gems[right]] = 1
                }
            }
        }
    }
    
    return [start + 1, end + 1]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
// [3, 7]

print(solution(["AA", "AB", "AC", "AA", "AC"]))
// [1, 3]
