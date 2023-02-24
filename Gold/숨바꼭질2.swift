import Foundation

// 수빈이는 현재 N(0<=N<=100,000) 동생은 K(0<=K<=100000)에 있다.
// 수빈이의 위치가 X일때 걷는다면 1초 후에는 X-1 또는 X+1 로 이동.
// 수빈이가 순간이동을 한다면 1초 후에는 2*X의 위치로 이동.
// 수빈이와 동생의 위치가 주어졌을 때 수빈이가 동생을 찾을 수 있는 가장 빠른 시간은 몇 초 후인지? 가장 빠른 시간으로 찾는 방법은 몇 가지 인지?

// 참고 : component->split. Int()-> Int(String()) 이 좀 더 변환이 빠르다고 한다.
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? -1 }
let n: Int = input[0]
let k: Int = input[1]

// 아이디어: 숨바꼭질 문제와 달리 찾는 방법도 세면된다.
// BFS. 이전에는 k와 동일하면 끝. 이번 문제는 같은 깊이에서 k와 동일한 갯수를 세면된다.

// 테스트 케이스
// 1 2
// 1 + 1 과 1 * 2 총 2가지 방법을 출력하면 된다.
// -> 방문하지 않은 노드중에 탐색이 아니라 최단 거리인 경우는 재방문 가능으로 변경.

var queue: [(Int, Int)] = []
var visited: [Int] = Array(repeating: Int.max, count: 100001)
var count: Int = 0
var front: Int = 0

queue.append((n, 0))
visited[n] = 0


while queue.count != front {
    
    // 동생의 위치보다 이미 먼 경우는 제외.
    if visited[queue[front].0] > visited[k] { break }
    
    if queue[front].0 == k {
        visited[k] = queue[front].1
        count += 1
    }
    
    for next in [queue[front].0 - 1, queue[front].0 + 1, queue[front].0 * 2] {
        if 100000 >= next && next >= 0 &&
            // 최단 거리일 때 재방문 가능.
            visited[next] >= visited[queue[front].0] + 1 {
            queue.append((next, visited[queue[front].0] + 1))
            visited[next] = visited[queue[front].0] + 1
        }
    }
    
    front += 1
}


print(visited[k])
print(count)

// 출처: https://please-amend.tistory.com/entry/백준-12851-숨바꼭질-2-스위프트Swift-풀이
// queue 에서 removeFirst 대신 front 라는 포인터를 사용.

// 입력
// 5 17

// 결과
// 4
// 2
