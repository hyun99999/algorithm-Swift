import Foundation

// a나라의 공격에 대항하여 b나라는 미사일들을 요격하려고 한다.
// 최소의 미사일을 사용해서 폭격 미사일을 요격.
// a나라는 개구간(포함x) (s,e) 형래톨 x축에 평행하게 발사.
// b나라는 y축에 수평이 되도록 미사일 발사하여 x축에 걸치는 모든 미사일을 요격.

func solution(_ targets:[[Int]]) -> Int {
    let sortedTargets: [[Int]] = targets.sorted { $0[1] < $1[1] }
    
    var count: Int = 1
    var currentE: Int = sortedTargets[0][1]
    
    for i in 0..<sortedTargets.count - 1 {
        if currentE <= sortedTargets[i + 1][0] {
            count += 1
            currentE = sortedTargets[i + 1][1]
        }
    }
    
    return count
}
