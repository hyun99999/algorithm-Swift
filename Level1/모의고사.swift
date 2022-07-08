
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let answer1 = [1, 2, 3, 4, 5]
    let answer2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let answer3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var score: [Int : Int] = [1 : 0, 2 : 0, 3 : 0]
    
    for i in 0..<answers.count {
        if answers[i] == answer1[i % answer1.count] { score[1]! += 1}
        if answers[i] == answer2[i % answer2.count] { score[2]! += 1}
        if answers[i] == answer3[i % answer3.count] { score[3]! += 1}
    }
    
    return score.filter { $0.value == score.values.max() }.keys.sorted(by: <)
}

let result = solution([1,2,3,4,5])
print(result)
