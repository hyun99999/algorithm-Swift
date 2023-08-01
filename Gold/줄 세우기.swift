// N명의 학생들이 키 순서대로 줄을 선다.
// 일부 학생들의 키를 비교한다. 각 학생이 설 수 있는 경우를 구하시오.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 진입 차수 배열.
var degree: [Int] = Array(repeating: 0, count: nm[0] + 1)
/// 앞서 있는 학생 배열.
var graph: [[Int]] = Array(repeating: [], count: nm[0] + 1)

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    degree[input[1]] += 1
    graph[input[0]].append(input[1])
}

// MARK: - 입력 끝.

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
            }
        }
    }
}

topologySort()

// 답이 여러 가지인 경우에 아무거나 출력.
print(answer.map { String($0) }.joined(separator: " "))
