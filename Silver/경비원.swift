// 경비원은 블록의 반시계 혹은 시계방향으로 돌아 이동하며 상점으로 간다.
// 블록의 크기, 상점의 개수, 경비원의 위치가 주어질 때 각 상점 사이의 최단 거리의 합을 구하시오.

/// 가로, 세로 길이
let cr: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 상점의 개수
let c: Int = Int(readLine()!) ?? 0

var stores: [[Int]] = []

for _ in 0..<c {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    stores.append(input)
}

let security: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 아이디어: 특정 위치에서 상점과 경비원까지의 거리를 구해서 거리의 절대값을 알면 된다.
func distance(_ direction: Int, _ x: Int) -> Int {
    if direction == 1 {
        // 북
        return x
    } else if direction == 2 {
        // 남
        return cr[0] + cr[1] + cr[0] - x
    } else if direction == 3 {
        // 서
        return cr[0] + cr[1] + cr[0] + cr[1] - x
    } else {
        // 동
        return cr[0] + x
    }
}

let securityDistance: Int = distance(security[0], security[1])

var answer: Int = 0

for store in stores {
    let d: Int = distance(store[0], store[1])
    
    answer += min(abs(d - securityDistance), 2 * (cr[0] + cr[1]) - abs(d - securityDistance))
}

print(answer)

/*
10 5
3
1 4
3 2
2 8
2 3
*/

// 답: 23
