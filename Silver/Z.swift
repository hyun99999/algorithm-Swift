import Foundation
// 정사각형 배열을 Z 모양으로 탐색.
// 2N-1 × 2N-1 로 4등분 한 후에 재귀적 순서대로 방문.
// r행 c열을 몇번째로 방문했는지 출력.

// 1 <= n <= 15
let nrc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var (n, r, c) = (nrc[0], nrc[1], nrc[2])
var count: Int = 0

while n != 0 {
    n -= 1
    
    let half: Int = Int(pow(2.0, Double(n)))
    // 1
    if r < half && c < half {
        count += 0
    }
    
    // 2
    if r < half && half <= c {
        count += half * half
        c -= half
    }
    
    // 3
    if half <= r && c < half {
        count += half * half * 2
        r -= half
    }
    
    // 4
    if half <= r && half <= c {
        count += half * half * 3
        r -= half
        c -= half
    }
}

print(count)

/*
2 3 1
*/

// 11
