import Foundation

func solution(_ word:String) -> Int {
    // 'A', 'E', 'I', 'O', 'U'
    // 구성된 모든 단어가 수록.
    // 길이 5이하.
    
    // 5번째 자리는 1마다 바뀌고,
    // 4번째 자리는 6마다 바뀌고, 5 * 1 + 1
    // 3번째 자리는 5(a,e,i,o,u) * 4번째 갯수(6마다 바뀜) + 1 = 31
    // 2번째 자리는 5씩 31번 바뀌고 다음 순서 + 1 = 156
    // 1번째 자리는 781 마다 바뀜.
    let dictionnary: [String.Element : Int] = ["A" : 0,  "E" : 1, "I" : 2, "O" : 3, "U" : 4]
    let counts: [Int] = [781, 156, 31, 6, 1]
    var answer: Int = 0
    
    for (index, word) in word.enumerated() {
        answer += (dictionnary[word]!) * (counts[index]) + 1
    }
    
    return answer
}

print(solution("AAAAE"))
// 6
