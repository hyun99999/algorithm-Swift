import Foundation

// 볼을 옮겨서 같은 색 볼끼리 인접하게 놓이도록 하려고 한다.
// 1. 바로 옆에 다른 색깔의 볼이 있으면 그 볼을 모두 뛰어넘을 수 있다.
// 2. 옮길 수 있는 볼의 색깔은 한 가지.
// 볼을 이동하여 같은 색끼리 모으되 최소 이동 횟수를 반환.

/// 볼의 총 개수
let n: Int = Int(readLine()!) ?? 0
/// 볼.
let balls: [String] = readLine()!.map { String($0) }

// 아이디어: 빨간, 파란 볼 각각 움직여 본다.
// 왼쪽에 빨강이 모일경우. 파랑이 모일경우.
// 오른쪽에 빨강이 모일경우. 파랑이 모일경우.
// 4가지 중 최솟값 출력.

var min: [Int] = []

// 왼쪽으로 빨강 모으기.
var isBlue: Bool = false
var count: Int = 0

for index in 0..<balls.count {
    if balls[index] == "R" {
        if isBlue {
            count += 1
        }
    } else {
        isBlue = true
    }
}
min.append(count)

// 왼쪽으로 파랑 모으기.
var isRed = false
count = 0

for index in 0..<balls.count {
    if balls[index] == "B" {
        if isRed {
            count += 1
        }
    } else {
        isRed = true
    }
}
min.append(count)

// 오른쪽으로 빨강 모으기.
isBlue = false
count = 0

for index in (0..<balls.count).reversed() {
    if balls[index] == "R" {
        if isBlue {
            count += 1
        }
    } else {
        isBlue = true
    }
}
min.append(count)

// 오른쪽으로 파랑 모으기.
isRed = false
count = 0

for index in (0..<balls.count).reversed() {
    if balls[index] == "B" {
        if isRed {
            count += 1
        }
    } else {
        isRed = true
    }
}
min.append(count)

print(min.min() ?? 0)

/*
9
RBBBRBRRR

결과
2
*/
