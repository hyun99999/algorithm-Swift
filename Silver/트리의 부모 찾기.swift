// 트리의 루트가 1일 떄, 각 노드의 부모를 구하시오.

let n: Int = Int(readLine()!) ?? 0

// bfs

var dictionary: [Int : [Int]] = [:]

for _ in 0..<n - 1 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    dictionary[input[0], default: []] += [input[1]]
    dictionary[input[1], default: []] += [input[0]]
}

var queue: [Int] = []
var parent: [Int] = Array(repeating: 0, count: n + 1)

func dfs(_ start: Int) {
    queue.append(start)
    parent[start] = start
    
    while !queue.isEmpty {
        let node: Int = queue.removeFirst()
        
        for next in dictionary[node, default: []] {
            if next != 1 && parent[next] != 0 {
                queue.append(next)
                parent[next] = node
            }
        }
    }
}

dfs(1)

// 2번 노드부터 출력.
for i in 2...n {
    print(parent[i])
}

/*
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 */

/*
 4
 6
 1
 3
 1
 4
 */
