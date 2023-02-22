import Foundation

// N개의 파티장이 연결되어 있다.
// 일방 통행이다.

// A->B 보다 다른 파티장을 경유해서 더 빨리 갈 수 있는 경우가 있다.
// C만큼의 시간 뒤에 B파티장이 새롭게 열릴 수 있다.

// 네비게이션 서비스를 제공하고 싶다. 한 파티장에서 다른 파티장까지 시간내에 도착할 수 있는지 없는지 알아보자

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
/// 파티장의 크기 5<= n <= 500
let n: Int = input[0]
/// 손님의 수 1<= m <= 10,000
let m: Int = input[1]

var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0) ?? -1 })
}

// 아이디어: 모든 노드에서 모든 노드로의 최단 거리. 가중치 존재. 플루이드 워셜.
// 2차원 방문 배열.
var newGraph: [[Int]] = graph

func floyd() {
    for next in 0..<n {
        for start in 0..<n {
            for end in 0..<n {
                newGraph[start][end] = min(newGraph[start][next] + newGraph[next][end], newGraph[start][end])
            }
        }
    }
}

floyd()

// 주어진 시간내에 다른 파티장으로 도착할 수 있는지 유무를 출력.
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }

    if newGraph[input[0] - 1][input[1] - 1] <= input[2] {
        print("Enjoy other party")
    } else {
        print("Stay here")
    }
}
