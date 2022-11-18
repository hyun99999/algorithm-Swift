import Foundation

// k 점부터 1점 까지의 사과
// 한 상자에 사과를 m개씩 담음
// (가장 낮은 점수 * 사과 갯수)가 한 상자의 가격

// 한 상자 단위로만 팔고, 남은 사과는 버림.
// 얻을 수 있는 최대 이익은?

// 총 만들 수 있는 상자 수
// 싼 점수의 사과

/*
func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var sortedScores: [Int] = score.sorted(by: >)
    var answer: Int = 0
    
    while sortedScores.count >= m {
        var apples: [Int] = []
        
        for _ in 0..<m {
            apples.append(sortedScores.removeFirst())
        }
        
        answer += apples[m - 1] * m
    }
    
    return answer
}
*/
// 테스트 11-15 시간 초과.
// while 문에서 시간 복잡도가 크다고 판단.

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var answer: Int = 0
    var sortedScores: [Int] = score.sorted(by: >)
    
    // m 간격으로 마지막 점수를 계산. 배열은 이미 정렬됨.
    // 인덱스로 접근하기 때문에 시간복잡도가 적다고 판단.
    
    // to 파라미터는 포함x
    // through 파라미터는 포함o
    
    for index in stride(from: m - 1, to: sortedScores.count, by: m) {
        answer += sortedScores[index] * m
    }
    
    return answer
}

print(solution(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
// 33
