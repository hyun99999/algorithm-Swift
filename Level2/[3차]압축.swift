import Foundation

func solution(_ msg:String) -> [Int] {
    // LZW(Lempel-Ziv-Welch) 압축 구현.
    // 1. 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
    // 2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
    // 3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
    // 4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
    // 5. 단계 2로 돌아간다.
    
    // 색인번호는 1부터 시작.
    // msg 는 1글자 이상. 1000글자 이하.
    let msg: [String] = msg.map { String($0) }
    
    var indexDictionary: [String : Int] = ["A" : 1, "B" : 2, "C" : 3, "D" : 4, "E" : 5, "F" : 6, "G" : 7, "H" : 8, "I" : 9, "J" : 10, "K" : 11, "L" : 12, "M" : 13, "N" : 14, "O" : 15, "P" : 16, "Q" : 17, "R" : 18, "S" : 19, "T" : 20, "U" : 21, "V" : 22, "W" : 23, "X" : 24, "Y" : 25, "Z" : 26]
    var index: Int = 0
    var str: String = ""
    var answer: [Int] = []

    while index < msg.count {
        let word: String = msg[index]
        let addedWord: String = word + str
        
        if indexDictionary[addedWord] == nil {
            indexDictionary[addedWord] = indexDictionary.count + 1
            answer.append(indexDictionary[str]!)
            str = ""
            
            continue
        }
        
        str = addedWord
        index += 1
    }
    answer.append(indexDictionary[str]!)
    
    return answer
}

print(solution("KAKAO"))
// [11, 1, 27, 15]
