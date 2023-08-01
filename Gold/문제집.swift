// n개의 문제로 되어 있는 문제집
// 문제는 난이도 순서.
// 다음의 조건에 따라서 문제를 풀기로 함.

// 1.N개의 문제는 모두 풀어야 한다.
// 2.먼저 풀어야 하는 문제는 반드시 먼저 풀어야 한다.
// 3.쉬운 문제부터 풀어야 한다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var graph: [[Int]] = Array(repeating: [], count: nm[0] + 1)
var degree: [Int] = Array(repeating: 0, count: nm[0] + 1)

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    graph[input[0]].append(input[1])
    degree[input[1]] += 1
}

var queue: [Int] = []
var answer: [Int] = []

func topologySort() {
    for i in 1...nm[0] {
        if degree[i] == 0 {
            queue.append(i)
        }
    }
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        answer.append(first)
        
        for next in graph[first] {
            degree[next] -= 1
            
            if degree[next] == 0 {
                queue.append(next)
                // ✅ 먼저 풀어야 하는 문제(진입 차수가 0) 중 쉬운 문제부터.
                // queue 에 넣고, 정렬.
                queue.sort(by: <)
            }
        }
    }
}

topologySort()

print(answer.map { String($0) }.joined(separator: " "))
