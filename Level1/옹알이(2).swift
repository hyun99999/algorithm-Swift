import Foundation

// [aya, ye, woo, ma] 네 가지 발음 가능.
// 네 가지 발음을 조합해서 가능. 연속 발음 못함.
func solution(_ babbling:[String]) -> Int {
    var answer: Int = 0
    let words: [String] = ["aya", "ye", "woo", "ma"]
    
    for index in 0..<babbling.count {
        var babblings: [String] = babbling[index].map { String($0) }
        var preBabbling: String = ""
        
        while !babblings.isEmpty {
            var isChanged: Bool = false
            
            // 아이디어 : 이전 발음을 제외하고 발음할 수 있는 단어인지 확인 후 배열을 슬라이싱.
            for index in 0..<words.count {
                if preBabbling != words[index] && babblings.count >= words[index].count {
                    if Array(babblings.prefix(words[index].count)) == words[index].map({ String($0) }) {
                        preBabbling = words[index]
                        babblings = Array(babblings[words[index].count..<babblings.count])
                        isChanged = true
                    } else {
                        continue
                    }
                }
            }
            
            // words 안의 단어로 변경되지 않았다면 더 이상 발음할 수 없다고 판단하고 while 문 탈출.
            if isChanged == false {
                break
            }

            if babblings.isEmpty {
                answer += 1
            }
        }
    }
    
    // babbling 매개변수에서 발음할 수 있는 단어의 개수를 반환.
    return answer
}

print(solution(["aya", "yee", "u", "maa"]))
// 1

print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
// 2
