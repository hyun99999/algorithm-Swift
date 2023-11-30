// 수 나누기 게임의 규칙
// 플레이어는 1부터 1,000,000 수가 적힌 서로 다른 카드를 한 장씩 나눠가짐
// 매 턴마다 다른 플레이어와 결투
// 자신의 수로 다른 플레이어의 수를 나눴을 때 나머지 0 승리. 다른 플레이어의 카드에 적힌 수로 나누어 떨어지면 패배. 둘다 아니면 무승부
// 승리 1획득 패배 1잃음 무승부 0
// 본인 제외 모든 플레이어와 결투하면 종료

// 모든 플레이어의 수를 구하시오

// n <= 100,000
// 100,000! 시간초과
// 최적화하는 완전탐색

let n: Int = Int(readLine()!) ?? 0
let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var visited: [Bool] = Array(repeating: false, count: 1000001)
var scores: [Int] = Array(repeating: 0, count: 1000001)

for i in 0..<input.count {
    visited[input[i]] = true
}

for i in 0..<input.count {
    for j in stride(from: input[i] * 2, through: 1000000, by: input[i]) {
        print(input[i], j)
        // 배수의 카드가 존재하는가?
        if visited[j] {
            // 승리
            scores[input[i]] += 1
            // 상대 플레이어의 패배
            scores[j] -= 1
        }
    }
}

for i in 0..<input.count {
    print(scores[input[i]], terminator: " ")
}

/*
3
3 4 12
*/

// 1 1 -2
