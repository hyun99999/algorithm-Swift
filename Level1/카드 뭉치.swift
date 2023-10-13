import Foundation

// cards1 과 cards2 에서 각각 순서대로 단어를 선택하여 goal 배열과 동일하게 만들려고 한다.
// 각각에는 서로 다른 단어들만 존재.
// 만들 수 있다면 Yes, 없다면 No 출력.
func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1index: Int = 0
    var cards2index: Int = 0
    var answer: String = "Yes"
    
    for i in 0..<goal.count {
        if cards1index < cards1.count && goal[i] == cards1[cards1index] {
            cards1index += 1
            continue
        }
        
        if cards2index < cards2.count && goal[i] == cards2[cards2index] {
            cards2index += 1
            continue
        }
        answer = "No"
    }
    
    return answer
}

print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
// Yes
