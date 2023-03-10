import Foundation

// 0과 1로만 이루어진 행렬 a,b
// a를 b로 바꾸는데 필요한 연산의 최솟값.
// 변환 연산 : 3*3 크기의 부분 행렬에 있는 모든 원소를 뒤집는다.

let nm: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? -1 }

var a: [[Int]] = []
for _ in 0..<nm[0] {
    a.append(readLine()!.map { Int(String($0)) ?? -1 })
}

var b: [[Int]] = []
for _ in 0..<nm[0] {
    b.append(readLine()!.map { Int(String($0)) ?? -1 })
}

// 아이디어: 그리디

/// 3*3 범위의 부분 행렬을 뒤집는다.
func flip(row: Int, col: Int) {
    for r in row..<row + 3 {
        for c in col..<col + 3 {
            a[r][c] = 1 - a[r][c]
        }
    }
}

var count: Int = 0

// 3*3보다 작은 행렬인 경우.
if nm[0] < 3 || nm[1] < 3 {
    if a == b {
        print(count)
    } else {
        print(-1)
    }
} else {
    for row in 0..<nm[0] - 2 {
        for col in 0..<nm[1] - 2 {
            if a[row][col] != b[row][col] {
                // 뒤집는다.
                flip(row: row, col: col)
                count += 1
            }
        }
    }

    if a == b {
        print(count)
    } else {
        print(-1)
    }
}

/*
3 4
0000
0010
0000
1001
1011
1001

결과
2
*/
