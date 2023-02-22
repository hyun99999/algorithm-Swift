import Foundation

// 수빈이는 현재 N(0<=N<=100,000) 동생은 K(0<=K<=100000)에 있다.
// 수빈이의 위치가 X일때 걷는다면 1초 후에는 X-1 또는 X+1 로 이동.
// 수빈이가 순간이동을 한다면 1초 후에는 2*X의 위치로 이동.
// 수빈이와 동생의 위치가 주어졌을 때 수빈이가 동생을 찾을 수 있는 가장 빠른 시간은 몇 초 후인가요?

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? -1 }
let n: Int = input[0]
let k: Int = input[1]

// 아이디어: 최단거리 구하기 문제.
// BFS
// 1초 마다 방문.
// 2 를 곱해서 K를 넘어선 순간 종료.

var visited: [Int] = Array(repeating: -1, count: 100001)
var queue: [Int] = []

queue.append(n)
visited[n] = 0

while !queue.isEmpty {
    let first: Int = queue.removeFirst()
    
    for next in [first - 1, first + 1, first * 2] {
        if 100000 >= next && next >= 0 && visited[next] == -1 {
            queue.append(next)
            visited[next] = visited[first] + 1
            
            // 주석시에 416ms
            // 주석해제시에 408ms
            if next == k {
                queue = []
                break
            }
        }
    }
}

print(visited[k])
