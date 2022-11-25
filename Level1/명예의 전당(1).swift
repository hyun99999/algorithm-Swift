import Foundation

// k 일 이전 : 제일 작은 수
// k 일 이후 : 제일 작은 수 보다 큰 수
func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer: [Int] = []
    var newScore: [Int] = []
    
    for index in 0..<score.count {
        newScore.append(score[index])
        newScore.sort(by: >)
        if newScore.count < k {
            answer.append(newScore.last!)
        } else {
            answer.append(newScore[k - 1])
        }
    }
    
    return answer
}

print(solution(3, [10, 100, 20, 150, 1, 100, 200]))
// [10, 10, 10, 20, 20, 100, 100]

print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))
// [0, 0, 0, 0, 20, 40, 70, 70, 150, 300]
