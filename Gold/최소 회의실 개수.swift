import Foundation

// n개의 회의를 모두 진행할 수 있는 최소 회의실 개수를 구하라
// 동시에 두 개 이상의 회의가 한 회의실에서 진행될 수 없다.


let n: Int = Int(readLine()!) ?? 0
var meeting: [(Int, Int)] = []

// 아이디어: 회의 시작 시간으로 오름차순 정렬. -> 우선순위 큐를 사용.
// 우선순위 큐 사용하지 않고 푸는 법.
// 시작 시간(1)과 종료 시간(-1)을 따로 본다. 오름차순 정렬.
// 단, 시작 시간과 종료 시간이 같을 때는 종료 시간 우선.

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    meeting.append((input[0], 1))
    meeting.append((input[1], -1))
}


// 출처: https://junbangg.github.io/boj/19598/
meeting.sort {
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    } else {
        return $0.0 < $1.0
    }
}

var answer: Int = 0
var sum: Int = 0
for (_, isStart) in meeting {
    sum += isStart
    answer = max(answer, sum)
}

print(answer)
