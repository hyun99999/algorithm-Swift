import Foundation

// ✅ 곡괭이를 선택하면 5개까지 캔다.
// -> 광물들을 5개씩 묶어서 피로도가 높은 광물 순서대로 정렬
// -> 다이아, 철, 돌 순서로 곡괭이를 사용하여 피로도 계산.
// 그리디.

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks: [Int] = picks
    var answer: Int = 0
    
    // 🚨 캘 수 없을 경우 분기처리. -> 시간초과를 해결.
    if picks == [0, 0, 0] {
        return 0
    }
    
    // 🚨 모든 광물에 대해서 묶음을 만드는 것이 아니라
    // 곡괭이를 사용할 수 있는 광물까지 묶음으로 만든다.
    var count: Int = 0
    
    if picks.reduce(0, +) * 5 > minerals.count {
        count = minerals.count
    } else {
        count = picks.reduce(0, +) * 5
    }
    
    // minerals 최대 50개
    var array: [[Int]] = Array(repeating: [0, 0, 0], count: 10)
    
    for i in 0..<count {
        if minerals[i] == "diamond" {
            array[i / 5][0] += 1
        }
        if minerals[i] == "iron" {
            array[i / 5][1] += 1
        }
        if minerals[i] == "stone" {
            array[i / 5][2] += 1
        }
    }
    
    // 다이아, 철, 돌 많은 순서로 정렬.
    array.sort {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] > $1[2]
            } else {
                return $0[1] > $1[1]
            }
        } else {
            return $0[0] > $1[0]
        }
    }
    
    for i in 0..<array.count {
        let (d, i, s) = (array[i][0], array[i][1], array[i][2])
        
        if picks[0] > 0 {
            picks[0] -= 1
            answer += d + i + s
        } else if picks[1] > 0 {
            picks[1] -= 1
            answer += d * 5 + i + s
        } else if picks[2] > 0 {
            picks[2] -= 1
            answer += d * 25 + i * 5 + s
        }
    }
    
    return answer
}
