import Foundation

// 다음의 규칙을 따라서 문자열을 분해
// 첫 글자를 x 라고 합니다.
// 왼->오 읽으면서 x와 x가 아닌 글자들이 나온 횟수를 각각 셉니다.
// 처음으로 두 횟수가 같아지는 순간 멈추고, 읽은 문자열을 분리.
// 남은 문자열에 대해서 이 과정을 반복. 남은 부분이없으면 종료.
// 두 횟수가 다른 상태에서 더 이상 읽을 글자가 없으면 문자열 분리 후, 종료.

// 분해한 문자열의 개수를 반환.
func solution(_ s:String) -> Int {
    var s: [String] = s.map { String($0) }
    var answer: Int = 0
    
    while !s.isEmpty {
        var first: String = ""
        var firstCount: Int = 0
        var nonCount: Int = 0
        
        first = s.removeFirst()
        firstCount += 1
        
        if s.isEmpty {
            // 더 이상 읽을 글자가 없으면 분리 후, 종료.
            answer += 1
            break
        } else {
            for _ in 0..<s.count {
                if s.first! != first {
                    nonCount += 1
                } else {
                    firstCount += 1
                }
                
                s.removeFirst()
                
                if nonCount == firstCount {
                    // 두 횟수가 같아지는 순간 분리.
                    answer += 1
                    break
                }
                
                // 테스트 케이스 4,7,35,36,37,39,41 을 해결할 수 있었다.
                // 두 횟수가 다른 상태에서 더이상 읽을 문자가 없으면 분리 후, 종료.
                if s.isEmpty {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}


//print(solution("banana"))
// 3

// 아마 테스트 케이스 4,7,35,36,37,39,41 가 이와 비슷한 경우였지 않았을까
print(solution("dddd"))
// 1

print(solution("aaabbaccccabba"))
// 3
