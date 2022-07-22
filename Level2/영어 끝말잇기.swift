import Foundation

// 중복된 단어를 언급했을 경우 탈락.
// 끝말잇기 단어가 이어지지 않을 경우 탈락.

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var usedWords: [[String.Element]: Bool] = [:]
    var alphabet: Character = "."
    
    for (index, value) in words.enumerated() {
        // [String.Element] 로 변환하여 subscript 사용하기.
        let value: [String.Element] = value.map { $0 }
        let first = value[0]
        let last = value[value.endIndex - 1]
        
        if index != 0 {
            if alphabet == first {
                if let _ = usedWords[value] {
                    // 탈락.(같은 단어 반복)
                    return [index % n + 1, index / n + 1]
                } else {
                    usedWords[value] = true
                    alphabet = last
                }
            } else {
                // 탈락.(끝말잇기 단어가 이어지지 않음)
                return [index % n + 1, index / n + 1]
            }
        } else {
            // index 가 0.
            usedWords[value] = true
            alphabet = last
        }
    }
    // 탈락자가 없다면 [0, 0] 반환
    return [0, 0]
}

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
// [3, 3]

print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
