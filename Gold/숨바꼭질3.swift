import Foundation

// 수빈이는 현재 N(0<=N<=100,000) 동생은 K(0<=K<=100000)에 있다.
// 수빈이의 위치가 X일때 걷는다면 1초 후에는 X-1 또는 X+1 로 이동.
// 수빈이가 순간이동을 한다면 0초 후에는 2*X의 위치로 이동.
// 수빈이와 동생의 위치가 주어졌을 때 수빈이가 동생을 찾을 수 있는 가장 빠른 시간은 몇 초 후인지?

// 참고 : component->split. Int()-> Int(String()) 이 좀 더 변환이 빠르다고 한다.
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? -1 }
let n: Int = input[0]
let k: Int = input[1]

var queue: [Int] = []
var visited: [Int] = Array(repeating: -1, count: 100001)

queue.append(n)
visited[n] = 0

while !queue.isEmpty {
    let first: Int = queue.removeFirst()
    
    if 100000 >= first * 2 {
        visited[first * 2] = visited[first]
        queue.append(first * 2)
        
        if first * 2 == k {
            break
        }
    }
    
    for next in [first - 1, first + 1] {
        if 100000 >= next && next >= 0 && visited[next] == -1 {
            queue.append(next)
            visited[next] = visited[first] + 1
        }
        
        if next == k {
            queue = []
            break
        }
    }
}

print(visited[k])
