import Foundation

// S에 시작해서 T에 끝나는 n개의 수업.
// 최소의 강의실을 사용해서 모든 수업을 가능하게 해야 한다.

// 최소 회의실 개수(19598번)과 동일한 문제.

let n: Int = Int(readLine()!) ?? 0
var timeline: [(Int, Int)] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? -1 }
    
    // 아이디어: 우선순위 큐를 사용하지 않음
    // 강의가 시작하면 1. 강의가 끝나면 -1.
    // 강의가 한번에 진행중인 최댓값을 구하면 된다.
    
    timeline.append((input[0], 1))
    timeline.append((input[1], -1))
}

timeline.sort {
    if $0.0 == $1.0 {
        // 시작 시간. 끝 시간. 동일하다면 끝내기 부터해야 강의실 수가 늘어나지 않음.
        return $0.1 < $1.1
    } else {
        return $0.0 < $1.0
    }
}

var answer: Int = 0
var sum: Int = 0

for (_, value) in timeline {
    sum += value
    answer = max(answer, sum)
}

print(answer)
