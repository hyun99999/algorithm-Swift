import Foundation

// 한 개의 회의실. 회의들이 겹치지 않게 회의실을 사용할 수 있는 최대 개수 구하기.
// 아이디어 : 그리디. 회의 끝나는 시간별로 오름차순으로 정렬하고 가능한 회의를 구성한다.

let n = Int(readLine()!) ?? 0
var times: [[Int]] = []
var answer: Int = 0
var endTime: Int = 0

for _ in 0..<n {
    times.append(readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 })
}

times.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    }
        return $0[1] < $1[1]
}

for time in times {
    if time[0] >= endTime {
        endTime = time[1]
        answer += 1
    }
}

print(answer)

/*
입력:
11
1 4
3 5
0 6
5 7
3 8
5 9
6 10
8 11
8 12
2 13
12 14
 */

// 출력
// 4
