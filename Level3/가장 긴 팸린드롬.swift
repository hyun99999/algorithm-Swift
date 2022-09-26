import Foundation

func solution(_ s:String) -> Int {
    // 팰린드롬: 앞뒤를 뒤짚어도 똑같은 문자열.
    // s 의 부분문자열 중 가장 긴 팰린드롬의 길이를 반환.
    
    /// 2개 이상의 팰린드롬이 없을 경우 가장 큰 길이의 팰린드롬은 1이다.
    var maxLength: Int = 1
    var s: [String] = s.map { String($0) }
    
    // ✅ 아이디어 : 왼쪽 시작 부터 완전 탐색으로 답 구하기
    // 가장 긴 팰린드롬의 길이를 반환하기 때문에 긴 문자에서부터 잘라가며 완전 탐색.
    for start in 0..<s.count - 1 {
        for end in (start + 1..<s.count).reversed() {
            var length: Int = end - start + 1
            
            // 최대 길이가 될 수 없다면 건너띄기.
            if length <= maxLength { continue }
            
            let mid: Int = length % 2 == 0 ? length / 2 : length / 2 + 1
            
            for mid in 0..<mid {
                if s[start + mid] != s[end - mid] {
                    // 팰린드롬이 아님.
                    length = -1
                    break
                }
            }
            
            if length == end - start + 1 {
                maxLength = max(maxLength, length)
            }
        }
    }

    return maxLength
}

print(solution("abcdcba"))
// 7
